Rails.application.routes.draw do
  root to:'toppages#index'
  resources :items, only: [:new]
  
  devise_for :users
  
end
