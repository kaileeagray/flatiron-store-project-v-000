module ApplicationHelper

  def current_cart
    Cart.find_by(id: params[:id])
  end
end
