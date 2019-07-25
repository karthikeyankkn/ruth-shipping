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

  # leads routes
  resources :leads do
    collection { post :import }
  end
  resources :leads
  post '/landingpage_lead', to: 'leads#landing_page_lead'
  get 'download_sample_leads_csv', to: "leads#download_sample_leads_csv", as: 'download_sample_leads_csv'


  #dashboard for users
  get 'dashboards/show_user_dashboard', as: "show_user_dashboard"

  # landing_page routes
  resources :landing_pages
  # get 'landing_pages/:id', to: 'landing_pages#render_page'
  get '/landing_page',  to: 'landing_pages#render_page'
end
