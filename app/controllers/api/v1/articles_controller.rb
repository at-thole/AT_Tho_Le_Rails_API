module Api::V1
  class ArticlesController < BaseController
    before_action :get_article, only: [:update, :destroy]

    def index
      articles = Article.all.includes :images, :user, :comments, :favorites,
        :categories
      render json: articles, each_serializer: Articles::ArticlesSerializer
    end

    def show
      article = Article.friendly.find params[:id]
      render json: article, serializer: Articles::ShowArticleSerializer
    end

    def create
      ActiveRecord::Base.transaction do
        article = current_user.articles.build article_params
        article.images.build picture: params[:article][:picture]
        article.save
        tags = params[:article][:tag].delete(" \/()!@{}$%^&*#[]|;:'").split(",")
        tags.each do |tag|
          Tag.find_or_create_by name: tag
        end
        tag_ids = Tag.select(:id).where name: tags
        article.tags_articles.create! tag_ids.map{|tag_id| {tag_id: tag_id.id}}
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

    private
    def article_params
      params.require(:article).permit(:title, :description, :content)
    end

    def get_article
      @article = Article.find_by id: params[:article][:id]
    end
  end
end
