module Api::V1
  class CommentsController < BaseController
    def index
      article = Article.find_by id: params[:article_id]
      comments = article.comments
      render json: comments, each_serializer: Comments::ShowCommentSerializer
    end

    def create
      comment = Comment.create! content: params[:comment][:content],
        user_id: params[:user_id], article_id: params[:article_id]
      render json: comment, serializer: Comments::ShowCommentSerializer
    end

    def update
      comment = Comment.find_by id: params[:comment][:id]
      if comment
        comment.update_attributes content: params[:comment][:content]
        render json: comment, serializer: Comments::ShowCommentSerializer
      else
        error = {error: {message: "Comment not found", status: 404}}
        render json: error
      end
    end

    def destroy
      comment = Comment.find_by id: params[:id]
      if comment
        comment.destroy
        success = {success: {message: "Delete successful", status: 200}}
        render json: success
      else
        error = {error: {message: "Comment not found", status: 404}}
        render json: error
      end
    end
  end
end
