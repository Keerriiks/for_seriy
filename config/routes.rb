Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  devise_scope :user do
    delete 'delete_account/:id', to: 'users/registrations#delete_account', as: 'delete_account_user'
    get 'users/sign_out', to: 'users/sessions#destroy'
  end

  resources :articles

  resources :subscriptions, only: [:create, :destroy]
  resources :post_subscriptions, only: [:create, :destroy]
  root "articles#index"
end
