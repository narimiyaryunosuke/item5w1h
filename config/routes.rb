Rails.application.routes.draw do
  resources :uploads
  root to:'toppages#index'
  devise_for :users
  resources :users, only:[:show, :edit, :update]
  resources :items, only: [:new, :show]
  resources :favorites, only: [:create, :destroy]
  resources :details, only: [:index, :new, :create, :edit, :update, :destroy]
  
end
