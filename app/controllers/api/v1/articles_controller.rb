module Api::V1
  class ArticlesController < BaseController
    before_action :get_article, only: [:update, :destroy]
    before_action :loged_in?, only: [:create, :update, :destroy]

    def index
      articles = Article.includes(:images, :user, :comments, :favorites,
        :categories).offset(params[:article_length]).limit(params[:limit])
      render json: articles, each_serializer: ::Articles::ArticlesSerializer
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
        article = current_user.articles.build title: params[:title],
          description: params[:description], content: params[:content]
        article.images.build picture: params[:picture]
        article.categories_articles.build category_id: params[:category]
        article.save
        tags = params[:tag].delete(" \/()!@{}$%^&*#[]|;:'").split(",")
        tags.each do |tag|
          Tag.find_or_create_by name: tag
        end
        tag_ids = Tag.select(:id).where name: tags
        article.tags_articles.create! tag_ids.map{|tag_id| {tag_id: tag_id.id}}
        success = {success: {message: "Create complete", status: 200}}
        render json: success
      end
      rescue
        error = {error: {message: "Internal server errors", status: 500}}
        render json: error
    end

    def update
      # @article.update_attributes title: params[:title], description: params[:description],
      #   content: params[:content]
      # @article.images.update_attributes picture: params[:picture]
      tags = params[:tag].delete(" \/()!@{}$%^&*#[]|;:'").split(",")
      binding.pry
    end

    def destroy
      @article.destroy
      success = {success: {message: "Delete successful", status: 200}}
      render json: success
    end

    private
    def get_article
      @article = Article.find_by id: params[:id]
    end
  end
end
