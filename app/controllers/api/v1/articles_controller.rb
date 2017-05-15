module Api::V1
  class ArticlesController < BaseController
    def index
      articles = Article.all.includes :images, :user
      render json: articles, each_serializer: Articles::ArticlesSerializer
    end

    def popular_article
    end

    def show
      article = Article.find_by id: params[:id]
      render json: article, serializer: Articles::ShowArticleSerializer
    end
  end
end
