Rails.application.routes.draw do
  devise_for :users
  # Phase 1：商品展示
  resources :users, only: [:edit, :update, :show]

  resources :products, only: [:index, :show]

  root "products#index"

  namespace :quisveniam do
    resources :products, except: [:show]
    root "products#index"
  end

  # Phase 2：商品與購物車 carts
  # 注意 cart 使用單數資源，carts#show URI = /cart
  resource :cart
  
  # Phase 3：成立訂單 orders
  # Phase 4：線上支付 payments
end
