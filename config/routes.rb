Rails.application.routes.draw do
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
  get 'customers/unsubscribe'
  get 'customers/withdrew'
  get 'homes/top'
  get 'homes/about'
  devise_for :customers
  get '/' => 'homes#top'
  get '/about' => 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
