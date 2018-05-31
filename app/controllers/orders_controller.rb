class OrdersController < ApplicationController
  # 除了成立訂單另外處理使用者是否登入，其餘的訂單行爲都要登入
  before_action :authenticate_user!, except: [:create]

  def index
    @orders = current_user.orders
  end

  def create
    # Check to see if the user is registered/logged in
    if current_user.nil?
      # Store the form data in the session so we can retrieve it after login
      session[:order_data] = params[:order]

      # Redirect the user to devise login page
      redirect_to new_user_session_path
    else
      # If the user is already logged in, proceed as normal
      @order = Order.new(order_params)
      @order.user_id = current_user.id
      @order.sn = Time.now.to_i
      @order.amount = current_cart.subtotal

      # 確認訂單是否成立成功
      if @order.save
        # 備份購物車商品資料至 order_item
        backup_cart_items(@order)

        # 刪除購物車 以及清空 session 中購物車的資訊
        current_cart.destroy
        session.delete(:cart_id)

        # 刪除 session 中的訂單收件人表單資料
        session.delete(:order_data)

        # 寄信至使用者的註冊信箱
        UserMailer.notify_order_create(@order).deliver_now!

        # 導向至 orders#show
        redirect_to order_path(@order.id), notice: "New order created!!!"
      else
        # 建立訂單失敗，返回購物車頁面
        @cart_items = current_cart.cart_items
        render "carts/show"
      end
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if @order.shipping_status == "not_shipped"
      @order.shipping_status = "cancelled"
      @order.save

      redirect_to order_path(@order.id), notice: "Order ##{@order.sn} cancelled !"
    end
  end

  private
  def order_params
    params.require(:order).permit(:name, :phone, :address)
  end

  def backup_cart_items(order)
    current_cart.cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.order_id = order.id
      @order_item.product_id = cart_item.product.id
      @order_item.price = cart_item.product.price
      @order_item.quantity = cart_item.quantity
      @order_item.name = cart_item.product.name
      @order_item.image = cart_item.product.image
      @order_item.description = cart_item.product.description
      @order_item.save
    end
  end
end
