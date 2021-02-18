Rails.application.routes.draw do
  namespace :admins do
    get 'orders/show'
  end
  namespace :admins do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admins do
    get 'items/index'
    get 'items/edit'
    get 'items/new'
    get 'items/show'
  end
  namespace :admins do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admins do
    get 'homes/top'
  end
  devise_for :admins
  get 'customers/edit' => 'customers#edit'
  devise_for :customers
  get 'orders/new'
  resources :orders, only: [:index, :show, :create]
  get 'orders/confirm'
  get 'orders/thanks'
  resources :cart_items, only: [:index, :create, :update, :destroy]
  get 'cart_items/destroy_all'
  # admin未作成のため、商品登録用に「create」追加してます。後々削除
  resources :items, only: [:index, :show, :create]
  # ↑↑
  resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
  resources :customers, only: [:show, :edit, :update]
  resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
  get 'customers/unsubscribe/:id' => 'customers#unsubscribe',as: 'confirm_unsubscribe'
  patch 'customers/withdrew/:id' => "customers#withdrew", as: 'customer_withdrew'
  get 'homes/top'
  get 'homes/about'
  root 'homes#top'
  get '/about' => 'homes#about'
  get 'customers/my_page' => 'customers#show', as: 'customers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
