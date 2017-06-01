class Api::V1::RelationshipsController < BaseController
  def create
    Relationship.create! follower_id: current_user.id, followed_id: params[:user_id]
  end

  def destroy
    relationship = Relationship.find_by follower_id: current_user.id, followed_id: params[:id]
    if relationship.destroy
      success = {success: {message: "Unfollow success", status: 200}}
      render json: success
    else
      error = {error: {message: "Not found", status: 404}}
      render json: error
    end
  end
end
