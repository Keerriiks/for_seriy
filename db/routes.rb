Rails.application.routes.draw do
    devise_for :users
    root 'posts#index'
  
    resources :posts
    resources :users, only: [:show, :index] do
      member do
        post 'follow'
        post 'unfollow'
      end
    end
  
    get 'search', to: 'posts#search', as: :search
  end