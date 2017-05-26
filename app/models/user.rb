# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  phone           :integer
#  address         :string(255)
#  avatar          :string(255)
#  slug            :string(255)
#  role            :integer          default("user")
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  auth_token      :string(255)
#
# Indexes
#
#  index_users_on_auth_token  (auth_token)
#

class User < ApplicationRecord
  enum role: [:user, :admin]

  extend FriendlyId
  friendly_id :username, use: [:slugged]

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  validates :username, presence: true, length: {in: 2..50}
  validates :email, presence: true, uniqueness: {case_sensitive: false},
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Email not validated"}
  # validates_numericality_of :phone, greater_than_or_equal_to: 0

  has_secure_password

  mount_uploader :avatar, PictureUploader

  acts_as_paranoid column: :deleted_at

  def avatar_url
    avatar.url
  end
end
