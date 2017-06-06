class Api::V1::Categories::ArticlesController < ApplicationController
  def index
    category = Category.find_by id: params[:category_id]
    if category
      articles = category.articles.offset(params[:article_length]).limit(params[:limit])
      render json: articles, each_serializer: ::Articles::ArticlesSerializer
    else
      error = {error: {message: "Category not found", status: 404}}
      render json: error
    end
  end
end
