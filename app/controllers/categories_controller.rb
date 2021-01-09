class CategoriesController < ApplicationController
  # line below is to user logged in user to view this page
  # before_filter :authorize

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
