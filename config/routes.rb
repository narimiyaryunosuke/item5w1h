Rails.application.routes.draw do
  root to:'toppages#index'
  devise_for :users
  resources :users, only:[:show]
  resources :items, only: [:new, :show]
  resources :favorites, only: [:create, :destroy]
  resources :details, only: [:index, :new, :create, :edit, :update, :destroy]
  
  
end
