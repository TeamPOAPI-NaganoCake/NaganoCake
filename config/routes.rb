Rails.application.routes.draw do
<<<<<<< HEAD
  get 'orders/new'
  get 'orders/index'
  get 'orders/show'
  get 'orders/create'
  get 'orders/confirm'
  get 'orders/thanks'
  get 'cart_items/index'
  get 'cart_items/create'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'cart_items/destroy_all'
  get 'items/index'
  get 'items/show'
  get 'deliveries/index'
  get 'deliveries/create'
  get 'deliveries/edit'
  get 'deliveries/update'
  get 'deliveries/destroy'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/update'
  get 'customers/unsubscribe'
  get 'customers/withdrew'
  get 'homes/top'
  get 'homes/about'
=======
  devise_for :customers
  get '/' => 'homes#top'
  get '/about' => 'homes#about'
>>>>>>> 03fa423b8822b8caa702cd72d3c50cd9642c05d4
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
