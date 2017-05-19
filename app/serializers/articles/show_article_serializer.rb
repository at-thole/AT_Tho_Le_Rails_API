class Articles::ShowArticleSerializer < ActiveModel::Serializer
  attributes :id, :is_like, :sum_like
  has_many :comments, serializer: Comments::ShowCommentSerializer

  def is_like

  end

  def sum_like
    Favorite.where(article_id: object.id).count(:id)
  end
end
