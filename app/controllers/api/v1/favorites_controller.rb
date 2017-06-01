class Api::V1::FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build article_id: params[:article_id]
    favorite.save
    render json: favorite
  end

  def destroy
    (Favorite.find_by user_id: (params[:favorite][:user_id]),
      article_id: params[:favorite][:user_id]).destroy
    success = {success: {message: "Delete successful", status: 200}}
    render json: success
  end
end
