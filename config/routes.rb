Rails.application.routes.draw do
  devise_for :users
  # Phase 1：商品展示
  resources :users, only: [:edit, :update, :show]

  resources :products

  root "products#index"

  namespace :quisveniam do
    resources :products
    root "products#index"
  end

  # Phase 2：商品與購物車 carts
  # Phase 3：成立訂單 orders
  # Phase 4：線上支付 payments

end
