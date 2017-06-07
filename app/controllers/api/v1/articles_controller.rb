module Api::V1
  class ArticlesController < BaseController
    before_action :loged_in?, only: [:create, :update, :destroy]
    before_action :get_article, only: [:update, :destroy]
    before_action :article_params, only: :update

    def index
      # users = User.where(id: current_user.following.select(:id))
      if params[:article_length].to_i == Article.all.size
        message = {message: "No more articles", status: 204}
        render json: message
      else
        articles = Article.includes(:images, :user, :comments, :favorites,
          :categories).order(created_at: :desc)
          .offset(params[:article_length]).limit(params[:limit])
        render json: articles, each_serializer: ::Articles::ArticlesSerializer
      end
    end

    def show
      article = Article.friendly.find params[:id]
      if article
        render json: article, serializer: ::Articles::ShowArticleSerializer
      else
        error = {error: {message: "Article not found", status: 404}}
        render json: error
      end
    end

    def create
      ActiveRecord::Base.transaction do
        article = current_user.articles.build article_params
        article.save!
        article.add_tags(params[:tag])
        article.add_table_search(params[:tag])
        success = {success: {message: "Create complete", status: 200}}
        render json: success
      end
      rescue
        error = {error: {message: "Internal server errors", status: 500}}
        render json: error
    end

    def update
      ActiveRecord::Base.transaction do
        @article.update! article_params
        message = {message: "success"}
        render json: message
      end
      rescue
        error = {error: {message: "Internal server errors", status: 500}}
        render json: error
    end

    def destroy
      @article.destroy
      success = {success: {message: "Delete successful", status: 200}}
      render json: success
    end

    private
    def get_article
      @article = Article.find_by id: params[:id]
      unless @article
        error = {error: {message: "Article not found", status: 404}}
        render json: error
      end
    end

    def article_params
      params.permit(:title, :description, :content,
        {categories_articles_attributes: [:id, :category_id]}, {images_attributes: :picture})
    end
  end
end
