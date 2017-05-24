module Api::V1
  class ArticlesController < BaseController
    before_action :get_article, only: [:update, :destroy]

    def index
      articles = Article.all.includes :images, :user
      render json: articles, each_serializer: Articles::ArticlesSerializer
    end

    def show
      article = Article.friendly.find params[:id]
      render json: article, serializer: Articles::ShowArticleSerializer
    end

    def create
      ActiveRecord::Base.transaction do
        article = current_user.articles.build article_params
        article.save
        Image.create! article_id: article.id, picture: params[:article][:picture]
        render json: article
      end
      rescue
        error = {error: {message: "Internal server errors", status: 500}}
        render json: error
    end

    def update
      @article.update_attributes article_params
      render json: @article
    end

    def destroy
      @article.destroy
      success = {success: {message: "Delete successful", status: 200}}
      render json: success
    end

    def popular_article
    end

    private
    def article_params
      params.require(:article).permit(:title, :description, :content)
    end

    def get_article
      @article = Article.find_by id: params[:article][:id]
    end
  end
end
