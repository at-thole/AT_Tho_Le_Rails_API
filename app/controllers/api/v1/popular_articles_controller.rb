class Api::V1::PopularArticlesController < ApplicationController
  def index
    popular_articles = Article.joins(:favorites).select("count(articles.id) as count_order, articles.*").group(:article_id).order("count_order desc").limit(5)
    binding.pry
    render json: popular_articles, each_serializer: ::Articles::PopularArticlesSerializer
  end
end
