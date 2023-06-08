Rails.application.routes.draw do
  devise_for :users
  root to: 'childcares#index'

  resources :childcares do
    resources :childcare_comments, only: :create
  end
  resources :users, only: :show
  resources :events
end
