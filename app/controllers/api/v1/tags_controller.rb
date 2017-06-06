class Api::V1::TagsController < ApplicationController
  def index
    tags = Tag.limit(10)
    render json: tags, each_serializer: ::Tags::TagsSerializer
  end
end
