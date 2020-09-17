Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users
  resources :items, only: [:new, :create]
  post 'items/new', to: 'items#create'
end
