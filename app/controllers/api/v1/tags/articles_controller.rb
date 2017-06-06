class Api::V1::Tags::ArticlesController < ApplicationController
  def index
    tag = Tag.find_by id: params[:tag_id]
    if tag
      articles = tag.articles
      render json: articles, each_serializer: ::Articles::ArticlesSerializer
    else
      error = {error: {message: "Tag not found", status: 404}}
      render json: error
    end
  end
end
