class StoreController < ApplicationController
  def index
    increment_count
    @products = Product.all
    @cart = current_cart
  end
end
