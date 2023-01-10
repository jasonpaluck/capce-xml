Rails.application.routes.draw do
  resources :uploads
  # devise_for :users #, only: []
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :users
  root to: 'uploads#index'
end
