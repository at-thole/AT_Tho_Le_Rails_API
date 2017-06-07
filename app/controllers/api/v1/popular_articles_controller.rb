class Api::V1::PopularArticlesController < ApplicationController
  def index
    popular_articles = Article.get_popular.limit(5)
    render json: popular_articles, each_serializer: ::Articles::PopularArticlesSerializer
  end
end
