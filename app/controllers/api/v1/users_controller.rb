module Api::V1
  class UsersController < BaseController
    before_action :user_params, only: :create

    def create
      user = User.create user_params
      if user
        render json: user, meta: {message: "Signup succesful", status: 200},
          serializer: Users::ShowUserSerializer
      else
        render status: 400
      end
    end

    private
    def user_params
      params.require(:user).permit :username, :email, :password,
        :password_confirmation , :phone, :address, :avatar
    end
  end
end
