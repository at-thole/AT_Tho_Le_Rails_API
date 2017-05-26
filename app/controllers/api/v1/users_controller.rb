module Api::V1
  class UsersController < ApplicationController
    before_action :user_params, only: :create

    def create
      user = User.new user_params
      if user.valid?
        user.save
        render json: user, meta: {message: "Signup succesful", status: 200},
          serializer: Users::ShowUserSerializer
      else
        error = {error: user.errors.messages, status: 201}
        render json: error
      end
    end

    def show
      user = User.friendly.find params[:id]
      render json: user, serializer: Users::ShowUserSerializer
    end

    private
    def user_params
      params.require(:user).permit :username, :email, :password,
        :password_confirmation , :phone, :address, :avatar
    end
  end
end
