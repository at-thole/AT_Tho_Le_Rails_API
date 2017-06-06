class Users::ShowUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :phone, :address, :about_me, :avatar_url, :following, :followers, :is_followed

  def following
    object.following.size
  end

  def followers
    object.followers.size
  end

  def is_followed
    current_user.follow object.id if current_user
  end
end
