require 'rails_helper'

describe Article do
  context 'Create is not valid' do
    before { @article = FactoryGirl.build(:article) }
    subject { @article }
    it "Create is not valid" do
      expect(@article).to be_valid
    end
  end
  context "Associations" do
    it { should have_many(:comments) }
    it { should have_many(:images) }
    it { should have_many(:favorites) }
    it { should have_many(:categories_articles) }
    it { should have_many(:categories) }
    it { should belong_to(:user) }
  end
end
