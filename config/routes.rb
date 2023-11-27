Rails.application.routes.draw do
  root "home#index"
  get "items/index"
  get "table/index"
  get "items/category/:category_id", to: "items#items_category", as: "items_category"
  get 'chat', to: 'chat#index', as: 'chat'

  post "items/order_item", to: 'items#order_item', as: 'order_item'
  post "order/set_status", to: 'orders#set_status', as: 'set_status'

  resources :payments
  resources :orders do
    member do
      get :items
    end
  end
  resources :items
  resources :clients, except: [:destroy] do
    post 'login', on: :collection
  end
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
