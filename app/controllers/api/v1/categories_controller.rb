class Api::V1::CategoriesController < BaseController
  def index
    categories = Category.all
    render json: {categories: categories}
  end
end
