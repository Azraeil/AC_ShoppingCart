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

    if order_params[:payment_status] == "paid"
      # 寄訂單已付款通知信至使用者的註冊信箱
      UserMailer.notify_order_paid(@order).deliver_now!
    elsif order_params[:shipping_status] == "shipped"
      # 寄訂單已出貨通知信至使用者的註冊信箱
      UserMailer.notify_order_shipped(@order).deliver_now!
    end

    redirect_to edit_quisveniam_order_path(@order.id), notice: "Order updated."
  end

  private
  def order_params
    params.require(:order).permit(:payment_status, :shipping_status)
  end
end
