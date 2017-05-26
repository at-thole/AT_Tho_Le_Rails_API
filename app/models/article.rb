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
  extend FriendlyId
  friendly_id :title, use: [:slugged]

  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags_articles, dependent: :destroy
  has_many :tags, through: :tags_articles, dependent: :destroy
  has_many :categories_articles, foreign_key: "article_id", dependent: :destroy
  has_many :categories, through: :categories_articles, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: {in: 3..100}
  validates :content, presence: true

  acts_as_paranoid column: :deleted_at
end
