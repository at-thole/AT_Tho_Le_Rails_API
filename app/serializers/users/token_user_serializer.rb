class Users::TokenUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :auth_token, :avatar_url
end
