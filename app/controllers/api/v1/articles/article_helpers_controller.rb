class Api::V1::Articles::ArticleHelpersController < ApplicationController
  def popular_articles
    popular_articles = Article.joins(:favorites).select("count(articles.id) as count_order, articles.*").group(:article_id).order("count_order desc")
    render json: popular_articles, each_serializer: ::Articles::PopularArticlesSerializer
  end

  def articles_by_user
    user = User.friendly.find params[:id]
    articles = user.articles
    render json: articles, each_serializer: ::Articles::ArticlesSerializer
  end
end
# Article.joins(:favorites).select("count(articles.id) as count_order, articles.*").group(:article_id).order("count_order desc")
