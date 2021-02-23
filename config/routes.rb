Rails.application.routes.draw do
  get 'search/search'
  get '/search' => 'search#search'
  root 'homes#top'
  get '/about' => 'homes#about'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  namespace :admins do
    # create仮作成
    resources :orders, only: [:show, :update, :create]
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
  get 'deliveries/edit' => 'deliveries#edit'
  delete 'cart_items/destroy_all' => "cart_items#destroy_all", as: "destroy_all"
  resources :cart_items, only: [:index, :create, :update, :destroy]

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

