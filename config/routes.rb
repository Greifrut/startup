Rails.application.routes.draw do
  root 'static_pages#index'

  resources :users
  resources :user_sessions, only: [:create, :destroy]

  delete '/sign_out', to: 'user_sessionss#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in
end
