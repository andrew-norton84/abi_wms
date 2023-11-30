Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root   "static_pages#home"
  get    "/help",         to: "static_pages#help"
  get    "/about",        to: "static_pages#about"
  get    "/contact",      to: "static_pages#contact"
  get    "/applications", to: "static_pages#applications"
  get    "/signup",       to: "users#new"
  get    "/login",        to: "sessions#new"
  post   "/login",        to: "sessions#create"
  delete "/logout",       to: "sessions#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :countries
  resources :warehouse_divisions
  resources :storage_locations
  resources :stock_types
  resources :location_types
  resources :product_types
  resources :products
  resources :customers
  resources :suppliers
  resources :location_properties
  resources :warehouse_locations
  get '/microposts', to: 'static_pages#home'
end