class Articles::ArticlesSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :updated_at, :count_comments, :count_favorites
  has_many :images
  belongs_to :user

  def count_comments
    return object.comments.size
  end

  def count_favorites
    return object.favorites.size
  end
end
