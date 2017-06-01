class Users::ShowUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :about_me, :avatar_url, :following, :followers

  def following
    object.following.size
  end

  def followers
    object.followers.size
  end
end
