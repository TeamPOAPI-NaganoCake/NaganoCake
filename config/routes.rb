Rails.application.routes.draw do
  root 'homes#top'
  get '/about' => 'homes#about'

  devise_for :admins
  namespace :admins do
    resources :orders, only: [:show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :show, :new, :create, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    get 'homes/top'
  end
  # ============================以下customer=======================================
  devise_for :customers
  get 'customers/edit' => 'customers#edit'
  get 'customers/my_page' => 'customers#show', as: 'customers'
  get 'customers/unsubscribe/:id' => 'customers#unsubscribe',as: 'confirm_unsubscribe'
  patch 'customers/withdrew/:id' => "customers#withdrew", as: 'customer_withdrew'

  delete 'cart_items/destroy_all' => "cart_items#destroy_all", as: "destroy_all"
  resources :cart_items, only: [:index, :create, :update, :destroy]

  # admin未作成のため、商品登録用に「create」追加してます。後々削除
  resources :items, only: [:index, :show, :create]

  # get 'orders/confirm'
  get 'orders/thanks'
  resources :orders, only: [:new, :create, :show, :index] do
    collection do
      post :confirm
      # post :thanks
    end
  end

  resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
  resources :customers, only: [:show, :edit, :update]
  resources :deliveries, only: [:index, :create, :edit, :update, :destroy]



end
