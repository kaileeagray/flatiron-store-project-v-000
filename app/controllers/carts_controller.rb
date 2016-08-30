class CartsController < ApplicationController
  def show
  end

  def create
  end

  def checkout
    @cart = current_user.current_cart
    LineItem.update_inventory(current_user.current_cart.line_items)
    current_user.remove_cart
    redirect_to cart_path(@cart)
  end

end
