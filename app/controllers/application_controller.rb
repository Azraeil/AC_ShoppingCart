class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # 加入認證程序，使用者需登入才能存取某些網站內容
  before_action :authenticate_user!

  # 請參考 Devise 文件自訂表單後通過 Strong Parameters 的方法
  # https://github.com/plataformatec/devise#strong-parameters
  # 注意有 sign_up 和 account_update 兩種參數要處理
  # add new permitted parameter to devise filter before add parameters to User
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Devise 客製化屬性
  def configure_permitted_parameters
    # 註冊時，多允許一個參數傳入
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # 編輯帳號時，多允許一個參數更新
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  # for admin authentication check
  def authenticate_admin
    unless current_user.is_admin?
      flash[:alert] = "You CANNOT Pass!"
      redirect_to root_path
    end
  end

  # 讓我們可以在 View 呼叫 current_cart
  helper_method :current_cart

  private
  def current_cart
    # 如果已經有 @cart 就回傳沒有的話就呼叫 set_cart 設定
    return @cart || set_cart
  end

  def set_cart
    if session[:cart_id]
      # 如果在 session 中能取出 "購物車 id"，表示 server 與 client 已經交換過資訊了
      # 因此可以在 carts table 裡找到那臺購物車的記錄
      @cart = Cart.find_by(id: session[:cart_id])
    end

    # 確保 @cart 存在，不存在的話就建立一個
    return @cart ||= Cart.create

    # 將 "購物車 id" 存入 session 中，傳到使用者的瀏覽器 cookie 中
    session[:cart_id] = @cart.id
    return @cart
  end
end
