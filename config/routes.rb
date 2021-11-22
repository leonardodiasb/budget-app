Rails.application.routes.draw do
  devise_for :users
  resources :users

  root 'user#index'
end
