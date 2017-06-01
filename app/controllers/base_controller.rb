class BaseController < ApplicationController
  before_action :loged_in?

  def current_user
    @current_user ||= User.find_by auth_token: response.request.env['HTTP_AUTH_TOKEN']
  end

  def loged_in?
    current_user.present?
    if current_user.blank?
      message = {message: "Please login"}
      render json: message
    end
  end
end
