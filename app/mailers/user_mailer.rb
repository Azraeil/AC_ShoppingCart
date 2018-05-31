class UserMailer < ApplicationMailer
  default from: "AC Shopping Cart Practice <info@test.com>"

  def notify_order_create(order)
    @order = order
    @content = "Your order is created. Thank you!"
    @username = order.user.name

    mail to: order.user.email,
    subject: "購物車練習 | sn：#{@order.sn} 訂單成立"
  end

  def notify_order_paid(order)
    @order = order
    @content = "Your order##{@order.sn} is paid. We will ship soon."
    @username = order.user.name

    mail to: order.user.email,
    subject: "購物車練習 | sn：#{@order.sn} 訂單已付款"
  end

  def notify_order_shipped(order)
    @order = order
    @content = "Your order##{@order.sn} is shipped."
    @username = order.user.name

    mail to: order.user.email,
    subject: "購物車練習 | sn：#{@order.sn} 訂單已出貨"
  end
end
