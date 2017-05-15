class Users::ShowUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :avatar
end
