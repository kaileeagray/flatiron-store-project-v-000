class LineItemsController < ApplicationController
  def create
    current_user.current_cart || current_user.create_current_cart
    if current_user.current_cart.line_items.exists?(item_id: params[:item_id])
      q = current_user.current_cart.line_items.find_by(item_id: params[:item_id]).quantity
      current_user.current_cart.line_items.find_by(item_id: params[:item_id]).update(quantity: q+1)
    else
      current_user.current_cart.items << Item.find(params[:item_id])
    end
    current_user.current_cart.save
    redirect_to cart_path(current_user.current_cart)
  end
end
