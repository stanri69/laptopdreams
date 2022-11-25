Rails.application.routes.draw do
  resources :rams
  resources :corps
  resources :batteries
  resources :screens
  resources :additionallies
  resources :connections
  resources :dataloggers
  resources :processors
  resources :videocards
  resources :laptops
  root 'laptops#index'
end
