class Api::V1::RelationshipsController < BaseController
  before_action :loged_in?, only: [:create, :destroy]

  def create
    Relationship.create! follower_id: current_user.id, followed_id: params[:user_id]
    success = {success: {message: "Follow success", status: 200}}
    render json: success
  end

  def destroy
    relationship = Relationship.find_by follower_id: current_user.id, followed_id: params[:user_id]
    if relationship
      relationship.destroy
      success = {success: {message: "Unfollow success", status: 200}}
      render json: success
    else
      error = {error: {message: "Relationship not found", status: 404}}
      render json: error
    end
  end
end
