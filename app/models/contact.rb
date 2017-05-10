class Contact < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true,
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Email not validated"}
  validates :content, presence: true
end
