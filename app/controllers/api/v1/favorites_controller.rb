class Api::V1::FavoritesController < BaseController
  before_action :loged_in?, only: [:create, :update, :destroy]

  def create
    favorite = current_user.favorites.build article_id: params[:article_id]
    favorite.save
    render json: favorite
  end

  def destroy
    current_user.favorites.find_by!(id: params[:id]).destroy
    success = {success: {message: "Delete successful", status: 200}}
    render json: success
  end
end
