Rails.application.routes.draw do
  devise_for :users
  root to: 'childcares#index'

  resources :childcares do
    resources :childcare_comments, only: :create
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
  
  resources :events do
    resources :event_comments,only: :create
  end

end
