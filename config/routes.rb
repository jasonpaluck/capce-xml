Rails.application.routes.draw do
  resources :uploads
  devise_for :users#, only: []
  resources :users
  root to: 'uploads#index'
end
