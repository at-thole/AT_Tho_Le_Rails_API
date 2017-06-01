class Articles::PopularArticlesSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :sum_like
  has_many :images, serializer: Images::ShowImageSerializer

  def sum_like
    object.favorites.size
  end
end
