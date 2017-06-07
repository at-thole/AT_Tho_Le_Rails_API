require 'rails_helper'
include UserHelperSpec

RSpec.describe Api::V1::UsersController, type: :controller do
  describe "POST /api/v1/users" do
    let!(:user) { FactoryGirl.attributes_for :user }
    it "response success" do
      post :create, params: {user: user}
      expect(response).to be_success
    end
  end

  describe "Get /api/v1/users/username" do
    let!(:user) { FactoryGirl.attributes_for :user }
    it "Returns the information personal" do
      get :show, id: user.id
      user_response = JSON.parse(response.body)
      expect(user_response['user'].except('password','following', 'followers', 'is_followed'))
        .to eql user
    end
  end
end
