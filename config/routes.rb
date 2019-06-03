Rails.application.routes.draw do
  get 'test/new'

  resources :users
  post '/signup',  to: 'users#create'
end
