Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
  }
  
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
