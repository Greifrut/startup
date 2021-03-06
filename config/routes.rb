Rails.application.routes.draw do
  resources :posts
  resources :friendships
  root 'static_pages#index'

  resources :users
  resources :notifications, only: [:index]
  resources :user_sessions, only: [:create, :destroy]

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in
end
