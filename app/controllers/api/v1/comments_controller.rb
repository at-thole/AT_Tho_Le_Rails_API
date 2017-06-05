module Api::V1
  class CommentsController < BaseController
    before_action :get_comment, only: [:update, :destroy]
    before_action :loged_in?, only: [:create, :update, :destroy]

    def index
      article = Article.find_by id: params[:article_id]
      comments = article.comments
      render json: comments, each_serializer: Comments::ShowCommentSerializer
    end

    def create
      comment = current_user.comments.build content: params[:comment][:content],
        article_id: params[:article_id]
      comment.save
      render json: comment, serializer: Comments::ShowCommentSerializer
    end

    def update
      @comment.update_attributes content: params[:comment][:content]
      render json: @comment, serializer: Comments::ShowCommentSerializer
    end

    def destroy
      @comment.destroy
      success = {success: {message: "Delete successful", status: 200}}
      render json: success
    end

    private
    def get_comment
      @comment = Comment.find_by id: params[:id]
      unless @comment
        error = {error: {message: "Comment not found", status: 404}}
        render json: error
      end
    end
  end
end
