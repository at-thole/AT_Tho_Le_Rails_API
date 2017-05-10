class User < ApplicationRecord
  has_many :comments
  has_many :favorites
  has_many :articles

  validates :username, presence: true, length: {in: 2..50}
  validates :email, presence: true, uniqueness: true,
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Email not validated"}
  validates_numericality_of :phone, greater_than_or_equal_to: 0
  validates :address, presence: true
end
