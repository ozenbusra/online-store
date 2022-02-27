Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
  root to: "pages#index"

  resources :items
  resources :stores
  resources :store_items
  resources :favorites

  namespace :api do
    resources :favorites
  end
end
