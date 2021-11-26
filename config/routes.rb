Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :groups do
      resources :entities
    end
  end

  authenticated :user do
    root :to => 'groups#index', as: :authenticated_root
  end

  root 'users#index'
end
