Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user_profile'
  get '/dashboard', to: 'pages#dashboard'
end
