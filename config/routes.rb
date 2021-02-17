Rails.application.routes.draw do
  get 'customers/edit' => 'customers#edit'
  devise_for :customers
  get 'orders/new'
  get 'orders/confirm'
  get 'orders/thanks'
  # resorcesは最後に記述しないと個別に規定したルーティングより優先されて処理されます。
  resources :orders, only: [:index, :show, :create]
  resources :cart_items, only: [:index, :create, :update, :destroy]
  get 'cart_items/destroy_all'
  # admin未作成のため、商品登録用に「create」追加してます。後々削除
  resources :items, only: [:index, :show, :create]
  # ↑↑
  resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
  resources :customers, only: [:show, :edit, :update]
  resources :deliveries, only: [:index, :create, :edit, :update, :destroy, :new]
  get 'customers/unsubscribe/:id' => 'customers#unsubscribe',as: 'confirm_unsubscribe'
  patch 'customers/withdrew/:id' => "customers#withdrew", as: 'customer_withdrew'
  get 'homes/top'
  get 'homes/about'
  root 'homes#top'
  get '/about' => 'homes#about'
  get 'customers/my_page' => 'customers#show', as: 'customers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
