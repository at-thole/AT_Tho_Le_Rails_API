# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  picture    :string(255)
#  article_id :integer
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_images_on_article_id  (article_id)
#
# Foreign Keys
#
#  fk_rails_028d35b473  (article_id => articles.id)
#

class Image < ApplicationRecord
  belongs_to :article

  mount_uploader :picture, PictureUploader

  acts_as_paranoid column: :deleted_at
end
