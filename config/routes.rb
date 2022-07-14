Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/profiles', to: 'profiles#index'
  get '/profiles/:id', to: 'profiles#show', as: 'user_profile'

  get "calendar", to: 'pages#calendar'
end
