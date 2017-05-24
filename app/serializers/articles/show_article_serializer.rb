class Articles::ShowArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :slug, :is_like, :sum_like
  has_many :comments, serializer: Comments::ShowCommentSerializer

  def is_like
    if current_user
      favorite = Favorite.find_by(article_id: object.id, user_id: current_user.id)
      favorite.present?
    end
  end

  def sum_like
    Favorite.where(article_id: object.id).count(:id)
  end
end
