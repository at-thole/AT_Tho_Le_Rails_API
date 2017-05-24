class BaseController < ApplicationController
  before_action :loged_in?, only: [:create, :update, :destroy]

  def current_user
    @current_user ||= User.find_by auth_token: response.request.env['HTTP_AUTH_TOKEN']
  end

  def loged_in?
    current_user.present?
  end
end
