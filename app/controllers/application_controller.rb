class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  private

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

    def increment_count
      if session[:counter].nil?
        session[:counter] = 0
      end
      session[:counter] += 1
    end

    def zero_count
      session[:counter] = 0
    end
end
