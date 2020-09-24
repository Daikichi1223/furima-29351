Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :orders, only:[:create]
end
