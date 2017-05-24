# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  has_many :categories_articles, foreign_key: "category_id"
  has_many :articles, through: :categories_articles

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  acts_as_paranoid column: :deleted_at
end
