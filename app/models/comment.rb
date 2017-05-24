# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  article_id :integer
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#  index_comments_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_03de2dc08c  (user_id => users.id)
#  fk_rails_3bf61a60d3  (article_id => articles.id)
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :content, presence: true

  acts_as_paranoid column: :deleted_at
end
