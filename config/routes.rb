Rails.application.routes.draw do
  
  
  get 'password_resets/new'
  get 'password_resets/edit'
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
  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :leads do
    collection { post :import }
  end
  resources :leads

  #dashboard for users
  get 'dashboards/show_user_dashboard', as: "show_user_dashboard"
end
