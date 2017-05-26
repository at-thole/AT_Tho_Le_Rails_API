class Articles::ArticlesSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :updated_at, :count_comments, :count_favorites
  has_many :images, serializer: Images::ShowImageSerializer
  belongs_to :user, serializer: Users::ShowUserSerializer
  has_many :categories, through: :categories_articles, serializer: Categories::ShowCategorySerializer

  def count_comments
    object.comments.size
  end

  def count_favorites
    object.favorites.size
  end
end
