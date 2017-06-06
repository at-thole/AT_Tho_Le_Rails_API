class Api::V1::FavoritesController < BaseController
  before_action :loged_in?, only: [:create, :destroy]

  def create
    favorite = current_user.favorites.build article_id: params[:article_id]
    favorite.save
    success = {success: {message: "Favorites complete", status: 200}}
    render json: success
  end

  def destroy
    favorite = Favorite.find_by user_id: current_user.id,
      article_id: params[:article_id]
    if favorite
      favorite.destroy
      success = {success: {message: "Delete successful", status: 200}}
      render json: success
    else
      error = {error: {message: "Favorite not found", status: 404}}
      render json: error
    end
  end
end
