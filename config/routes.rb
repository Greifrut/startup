Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:create, :destroy]

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_session#new', as: :sign_in

end
