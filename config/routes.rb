Rails.application.routes.draw do
  
  root 'sessions#new'

  get 'sessions/new'
  get 'test/new'

  #session routes
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # user routes
  resources :users
  resources :account_activations, only: [:edit]
  post '/signup',  to: 'users#create'
end
