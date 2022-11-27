Rails.application.routes.draw do
  devise_for :users
  scope '/admin' do
    resources :users
  end
  resources :roles
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
