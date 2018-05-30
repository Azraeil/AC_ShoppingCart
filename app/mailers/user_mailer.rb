class UserMailer < ApplicationMailer
  default from: "AC Shopping Cart Practice <info@test.com>"

  def notify_order_create(order)
    @order = order
    @content = "Your order is created. Thank you!"

    mail to: order.user.email,
    subject: "購物車練習 | 訂單成立：#{@order.id},sn：#{@order.sn}"

  end
end
