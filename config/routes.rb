Rails.application.routes.draw do
  devise_for :sellers
  devise_for :users
  resources :videocards
  resources :screens
  resources :rams
  resources :processors
  resources :dataloggers
  resources :corps
  resources :connections
  resources :batteries
  resources :additionallies
  resources :laptops
  root 'laptops#index'
end
