class CartsController < ApplicationController
  def plus_quantity
    cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
    cart_item.quantity += 1

    cart_item.save
    redirect_back(fallback_location: root_path)
  end

  def minus_quantity
    cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
    if cart_item.quantity > 1
      cart_item.quantity -= 1

      cart_item.save
      redirect_back(fallback_location: root_path)
    end
  end

  def remove_product
    cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
    cart_item.destroy

    redirect_back(fallback_location: root_path)
  end

  def show
    @cart_items = current_cart.cart_items
  end
end
