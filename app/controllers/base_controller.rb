class BaseController < ApplicationController
  before_action :check_login, only: [:create, :update, :destroy]

  private
  def check_login
    user = User.find_by id: params[:user_id]
    unless user && user.auth_token == params[:auth_token]
      error = {error: {message: "Please login", status: 301}}
      render json: error
    end
  end
end
