Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :groups do
      resources :entities
    end
  end

  root 'users#index'
end
