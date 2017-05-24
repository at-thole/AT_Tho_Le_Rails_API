# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  content     :text(65535)
#  user_id     :integer
#  deleted_at  :datetime
#  slug        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_3d31dad1cc  (user_id => users.id)
#

class Article < ApplicationRecord
  has_many :comments
  has_many :images
  has_many :favorites
  has_many :categories_articles, foreign_key: "article_id"
  has_many :categories, through: :categories_articles
  belongs_to :user

  validates :title, presence: true, length: {in: 3..100}
  validates :content, presence: true

  acts_as_paranoid column: :deleted_at

  extend FriendlyId
  friendly_id :title, use: [:slugged]
end
