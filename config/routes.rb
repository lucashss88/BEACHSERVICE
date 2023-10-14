Rails.application.routes.draw do
  root "home#index"
  get "items/index"
  resources :payments
  resources :orders
  resources :items
  resources :clients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
