class Category < ApplicationRecord
  has_many :categories_articles, foreign_key: "category_id"
  has_many :articles, through: :categories_articles

  validates :name, presence: true, uniqueness: true
end
