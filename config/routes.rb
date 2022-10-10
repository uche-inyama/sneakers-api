Rails.application.routes.draw do
  # devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
  }

  resources :users, only: [:create]
  namespace :admins do 
    resources :accounts
  end
  
  post '/webhooks/:sources', to: "webhooks#create"
  post '/sign_in', to: "users#sign_in", as: :users_login
  delete '/sign_out', to: "users#sign_out", as: :users_sign_out
  
  resources :products do
    resources :samples, shallow: true
  end
  
  unauthenticated :admin do
    root "home#index", as: :unauthenticated_root
  end
  
  authenticated :admin do
    root "products#index", as: :authenticated_root
  end
end
