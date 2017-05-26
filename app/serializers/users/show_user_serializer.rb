class Users::ShowUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar_url
end
