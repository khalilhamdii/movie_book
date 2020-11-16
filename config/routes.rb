Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :sessions, only: [:index, :new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
