class Article < ApplicationRecord
  has_many :comments
  has_many :images
  has_many :favorites
  has_many :categories_articles, foreign_key: "article_id"
  has_many :categories, through: :categories_articles
  belongs_to :user

  validates :title, presence: true, length: {in: 3..100}
  validates :content, presence: true
end
