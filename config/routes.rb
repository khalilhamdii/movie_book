Rails.application.routes.draw do
  root 'home#index'
  resources :users
  resources :home
  resources :articles, only: [:index,:new, :create, :show] do
    resources :votes, only: [:create, :destroy]
  end
  resources :categories
  resources :sessions, only: [:index, :new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
