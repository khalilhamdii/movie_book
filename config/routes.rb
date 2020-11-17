Rails.application.routes.draw do
  root 'home#index'
  resources :users
  resources :home
  resources :articles
  resources :sessions, only: [:index, :new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
