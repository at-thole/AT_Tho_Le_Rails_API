class Api::V1::Users::ArticlesController < BaseController
  def index
    begin
      user = User.friendly.find params[:user_id]
      unless current_user.follow(user.id) || current_user.eql?(user)
        message = {message: "No data. Follow user to see more articles"}
        render json: message
      else
        articles = user.articles.offset(params[:article_length]).limit(params[:limit])
        render json: articles, each_serializer: ::Articles::ArticlesSerializer
      end
    rescue
      error = {error: {message: "User not found", status: 404}}
      render json: error
    end
  end
end
