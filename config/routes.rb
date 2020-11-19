Rails.application.routes.draw do
  root 'categories#index'
  resources :users
  resources :articles, only: [:index,:new, :create, :show] do
    resources :comments, only: [:create, :destroy]
    resources :votes, only: [:create, :destroy]
  end
  resources :categories, only: [:index, :show]
  resources :sessions, only: [:index, :new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
