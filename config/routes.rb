Rails.application.routes.draw do
  resources :coupons
  resources :item_images
  #devise_for :users
  resources :shipping_types
  resources :order_states
  resources :orders
  resources :order_items
  resources :items
  root to: "main#index"
  get '/add_to_cart', to: 'main#add_to_cart'
  get '/remove_from_cart', to: 'main#remove_from_cart'
  get '/select_shipping', to: 'main#select_shipping'
  get '/shipping_selector', to: 'main#shipping_selector'
  get '/change_cart_item_amount', to: 'main#change_cart_item_amount'
  get '/clear_cart', to: 'main#clear_cart'
  get '/about', to: 'main#about'
  get '/contact', to: 'main#contact'
  get '/maintenance', to: 'main#maintenance'
  get '/apply_coupon', to: 'coupons#apply'
  devise_for :users, controllers: { registrations: 'users/registrations'  }
  post "subscribe" => "email_subscription#subscribe", as: "subscribe"
  get "unsubscribe" => "email_subscription#unsubscribe", as: "unsubscribe"
  get "confirm_subscription" => "email_subscription#confirm_subscription", as: "confirm_subscription"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end