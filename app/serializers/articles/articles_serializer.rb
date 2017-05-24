class Articles::ArticlesSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :updated_at, :count_comments, :count_favorites
  has_many :images
  belongs_to :user, serializer: Users::ShowUserSerializer
  has_many :categories, through: :categories_articles, serializer: Categories::ShowCategorySerializer

  def count_comments
    return object.comments.size
  end

  def count_favorites
    return object.favorites.size
  end
end
