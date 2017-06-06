module Api::V1
  class SessionsController < BaseController
    before_action :loged_in?, only: :destroy

    def create
      user = User.find_by email: params[:email]
      if user && user.authenticate(params[:password])
        user.update_columns auth_token: SecureRandom.hex
        render json: user, serializer: ::Users::TokenUserSerializer
      else
        error = {error: {message: "Invalid email or password", status: 400}}
        render json: error
      end
    end

    def destroy
      user = User.find_by id: params[:id]
      unless user
        error = {error: {message: "User not found", status: 404}}
        render json: error
      else
        user.update_columns(auth_token: nil) if user.auth_token == response.request.env['HTTP_AUTH_TOKEN']
      end
    end
  end
end
