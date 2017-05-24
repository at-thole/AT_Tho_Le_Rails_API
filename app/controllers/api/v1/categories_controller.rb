class Api::V1::CategoriesController < BaseController
  before_action :get_category, only: [:update, :destroy]

  def index
    categories = Category.all
    render json: {categories: categories}
  end

  def create
    category = Category.create! name: params[:category][:name]
    render json: category
  end

  def update
    @category.update_columns name: params[:category][:name]
    render json: @category
  end

  def destroy
    @category.destroy
    success = {success: {message: "Delete successful", status: 200}}
    render json: success
  end

  private
  def get_category
    @category = Category.find_by id: params[:category][:id]
  end
end
