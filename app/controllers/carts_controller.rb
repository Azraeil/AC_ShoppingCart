class CartsController < ApplicationController
  def adjust_quantity
    cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
    if params[:type] == "plus"
      cart_item.quantity += 1
    elsif cart_item.quantity > 1 && params[:type] == "minus"
      cart_item.quantity -= 1
    end
    cart_item.save

    redirect_back(fallback_location: root_path)
  end

  def remove_product
    cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
    cart_item.destroy

    redirect_back(fallback_location: root_path)
  end

  def show
    @cart_items = current_cart.cart_items

    if session[:order_data].present?
      @order = Order.new(session[:order_data])
    else
      @order = Order.new
    end
  end
end
