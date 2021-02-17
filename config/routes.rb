Rails.application.routes.draw do
  get 'customers/edit' => 'customers#edit'
  devise_for :customers
  get 'orders/new'
  resources :orders, only: [:index, :show, :create]
  get 'orders/confirm'
  get 'orders/thanks'
  resources :cart_items, only: [:index, :create, :update, :destroy]
  get 'cart_items/destroy_all'
  resources :items, only: [:index, :show]
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
