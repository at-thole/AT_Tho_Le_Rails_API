class Api::V1::FavoritesController < ApplicationController
  def create
    favorite = Favorite.create! favorite_params
    render json: favorite
  end

  def destroy
    (Favorite.find_by user_id: (params[:favorite][:user_id]),
      article_id: params[:favorite][:user_id]).destroy
    success = {success: {message: "Delete successful", status: 200}}
    render json: success
  end

  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :article_id)
  end
end
