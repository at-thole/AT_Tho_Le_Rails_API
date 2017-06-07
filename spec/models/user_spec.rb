require 'rails_helper'

describe User, type: :model do
  let!(:user) {FactoryGirl.create :user}
  subject{user}

  context "username is invalid" do
    before {subject.username}
    it {is_expected.to be_valid}
  end

  context "username length is invalid" do
    before {subject.username = "vasd"}
    it {is_expected.to be_valid}
  end

  context "email is invalid" do
    before{subject.email}
    it {is_expected.to be_valid}
  end

  context "email is invalid format" do
    before{subject.email}
    it {is_expected.to be_valid}
  end
end

