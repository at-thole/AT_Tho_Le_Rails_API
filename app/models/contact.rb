# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  email      :string(255)
#  content    :string(255)
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true,
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Email not validated"}
  validates :content, presence: true

  acts_as_paranoid column: :deleted_at
end
