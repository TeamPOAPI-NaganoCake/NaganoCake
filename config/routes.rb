Rails.application.routes.draw do
  namespace :admins do
    resources :customers, only: [:index, :edit, :show, :update]

    resources :items, only: [:new, :index, :create, :edit, :show, :update]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :orders, only: [:show, :update] do
      resources :order_items, only: [:update]
    end

    get 'homes/top'
  end
  get '/admin', to: 'admin/homes#top'

  devise_for :admins
  get 'customers/edit' => 'customers#edit'
  devise_for :customers
  get 'orders/new'
  resources :orders, only: [:index, :show, :create]
  get 'orders/confirm'
  get 'orders/thanks'
  delete 'cart_items/destroy_all' => "cart_items#destroy_all", as: "destroy_all"
  resources :cart_items, only: [:index, :create, :update, :destroy]
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

