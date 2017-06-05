class Api::V1::Articles::ArticleHelpersController < BaseController
  def popular_articles
    popular_articles = Article.joins(:favorites).select("count(articles.id) as count_order, articles.*").group(:article_id).order("count_order desc")
    render json: popular_articles, each_serializer: ::Articles::PopularArticlesSerializer
  end

  def articles_by_user
    begin
      user = User.friendly.find params[:id]
      unless current_user.follow(user.id)
        message = {message: "No data. Follow user to see more articles"}
        render json: message
      else
        articles = user.articles
        render json: articles, each_serializer: ::Articles::ArticlesSerializer
      end
    rescue
      error = {error: {message: "User not found", status: 404}}
      render json: error
    end
  end
end
