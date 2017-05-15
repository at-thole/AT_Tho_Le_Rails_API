class Comments::ShowCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
  belongs_to :user, serializer: Users::ShowUserSerializer
end
