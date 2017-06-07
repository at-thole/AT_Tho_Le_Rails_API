require 'rails_helper'

describe Category, type: :model do
  let(:category) { @category = Category.create! name: "asdasdasdasd"}
  subject{category}

  context "category is invalid" do
    before do
      category.name
    end
    it do
      is_expected.to be_valid
    end
  end
end

