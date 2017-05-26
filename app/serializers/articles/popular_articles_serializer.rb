class Articles::PopularArticlesSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :images, serializer: Images::ShowImageSerializer
end
