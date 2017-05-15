module Api::V1
  class SessionsController < ApplicationController
    def create
      user = User.find_by email: params[:session][:email]
      if user && user.authenticate(params[:session][:password])
        user.update_columns auth_token: (SecureRandom.hex + Time.now.to_s)
        render json: user
      else
        login_fail = {error: {message: "Invalid email or password", status: 400}}
        render json: login_fail
      end
    end

    def destroy
      user = User.find_by id: params[:session][:id]
      user.update_columns(auth_token: nil) if user.auth_token == params[:session][:auth_token]
    end
  end
end
