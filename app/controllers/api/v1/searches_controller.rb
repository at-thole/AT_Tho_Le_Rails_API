class Api::V1::SearchesController < ApplicationController
  def create
    if params[:key_search].present?
      article_ids = Search.get_article_id(params[:key_search]).select(:article_id)
      articles = Article.where(id: article_ids)
      render json: articles, each_serializer: ::Articles::ArticlesSerializer
    end
  end
end
