Rails.application.routes.draw do
  devise_for :users
  # Phase 1：商品展示
  resources :users, only: [:edit, :update, :show]

  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart
    end
  end

  root "products#index"

  namespace :quisveniam do
    resources :products, except: [:show]
    resources :orders, only: [:index, :edit, :update]
    root "products#index"
  end

  # Phase 2：商品與購物車 carts
  # 注意 cart 使用單數資源，carts#show URI = /cart
  resource :cart, only: [:show] do
    collection do
      post :adjust_quantity
      delete :remove_product
    end
  end

  # Phase 3：成立訂單 orders
  resources :orders, only: [:create, :index, :show, :update]

  # Phase 4：線上支付 payments
end
