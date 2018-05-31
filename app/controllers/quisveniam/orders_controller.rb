class Quisveniam::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    @order.update(order_params)
    redirect_to edit_quisveniam_order_path(@order.id), notice: "Order updated."
  end

  private
  def order_params
    params.require(:order).permit(:payment_status, :shipping_status)
  end
end
