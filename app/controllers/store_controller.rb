class StoreController < ApplicationController
  def index
    increment_count
    @products = Product.all
  end
end
