Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users
  root to: 'childcares#index'

  resources :childcares do
    resources :childcare_comments, only: :create
    resource :likes, only: [:create, :destroy] 
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings', to: 'followings#index'
    get 'followers', to: 'followers#index'
  end
  
  resources :events do
    resources :event_comments,only: :create
  end

  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
  
end
