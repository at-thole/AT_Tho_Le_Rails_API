require 'rails_helper'

describe User do
  context 'Create is not valid' do
    before { @user = FactoryGirl.build(:user) }
    subject { @user }
    it "Create is not valid" do
      expect(@user).to be_valid
    end
  end
  context "Associations" do
    it { should have_many(:comments) }
    it { should have_many(:favorites) }
    it { should have_many(:articles) }
  end
end

