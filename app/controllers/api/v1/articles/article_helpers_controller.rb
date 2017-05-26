class Api::V1::Articles::ArticleHelpersController < ApplicationController
  def popular_articles
    popular_articles = Article.where id: Favorite.group(:article_id).count.keys.slice(0..2)
    render json: popular_articles, each_serializer: ::Articles::PopularArticlesSerializer
  end

  def articles_by_user
    user = User.friendly.find params[:id]
    articles = user.articles
    render json: articles, each_serializer: ::Articles::ArticlesSerializer
  end
end
