class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_cart_item(@product)

    # 加入購物車後導到首頁？
    redirect_to root_path
  end
end
