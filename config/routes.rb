Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  devise_scope :user do
    delete 'delete_account/:id', to: 'users/registrations#delete_account', as: 'delete_account_user'
    delete 'users/sign_out', to: 'users/sessions#destroy'
    get 'check_email', to: 'users/sessions#check_email', as: 'check_email'
    resources :users
  end


  root "articles#index"
end
