class Admin::DashboardController < ApplicationController
  def show
    @product = Product.count
    @categories = Category.count
  end
end
