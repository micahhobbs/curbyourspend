Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users
  root to: 'pages#home'


  resources :items do
    resources :comments, only: [:new, :create]
  end
  resources :comments, only: [:destroy]

  post 'items/:item_id/buy', to: 'items#buy', as: 'item_buy'
  post 'items/:item_id/abandon', to: 'items#abandon', as: 'item_abandon'

  resources :profiles, only: [:index, :show]

  get 'dashboard', to: 'pages#dashboard'

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "calendar", to: 'pages#calendar'
  post '/email_test', to: 'pages#email_test'
end
