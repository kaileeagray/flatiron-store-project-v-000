class CartsController < ApplicationController
  def show

  end

  def create
  end

  def checkout
    redirect_to cart_path
  end

end
