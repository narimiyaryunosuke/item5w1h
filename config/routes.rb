Rails.application.routes.draw do
  root to:'toppages#index'
  resources :users, only:[:show]
  resources :items, only: [:new]
  resources :favorites, only: [:create, :destroy]
  
  devise_for :users
  
end
