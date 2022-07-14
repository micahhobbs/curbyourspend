Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :items do
    resources :comments, only: [:new, :create]
  end
  resources :comments, only: [:destroy]
  resources :profiles, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user_profile'
  get "calendar", to: 'pages#calendar'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
