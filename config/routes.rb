Rails.application.routes.draw do
  devise_for :users
  root to: 'childcares#index'

  resources :childcares
end
