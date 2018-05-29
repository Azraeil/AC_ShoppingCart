class OrdersController < ApplicationController
  # 成立訂單時要求使用者登入，且在成立訂單後導入訂單 orders#show 頁面
  before_action :authenticate_user!

  def new
    @order = Order.new
  end

  def create

  end

  def index

  end

  def show

  end

  def destroy

  end
end
