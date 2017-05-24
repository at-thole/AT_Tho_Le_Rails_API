module Api::V1
  class CommentsController < BaseController
    before_action :get_comment, only: [:update, :destroy]

    def index
      article = Article.find_by id: params[:article_id]
      comments = article.comments
      render json: comments, each_serializer: Comments::ShowCommentSerializer
    end

    def create
      comment = current_user.comments.build comment_params
      comment.save
      render json: comment, serializer: Comments::ShowCommentSerializer
    end

    def update
      @comment.update_attributes comment_params
      render json: @comment, serializer: Comments::ShowCommentSerializer
    end

    def destroy
      @comment.destroy
      success = {success: {message: "Delete successful", status: 200}}
      render json: success
    end

    private
    def comment_params
      params.require(:comment).permit :content, :article_id
    end

    def get_comment
      @comment = Comment.find_by id: params[:comment][:id]
      unless @comment
        error = {error: {message: "Comment not found", status: 404}}
        render json: error
      end
    end
  end
end
