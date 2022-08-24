Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
  }
  resources :products do
    resources :samples, shallow: true
  end
  
  unauthenticated do
    root to: "home#index", as: :unauthenticated_root
  end
  
  authenticated do
    root to: "products#index"
  end
end
