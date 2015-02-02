Rails.application.routes.draw do

  # Forem Engine
  mount Forem::Engine, :at => '/forums'

  # Root path
  root 'home#index'

  # Devise users
  devise_for :users

  # Admin control panel
  namespace :admin do
    resources :users
  end

  resources :servers

  # Information

  get '/info/terms', to: 'home#terms', as: 'terms'
  get '/info/rules', to: 'home#rules', as: 'rules'

  # Users and Stats

  get '/stats', to: 'stats#index', as: 'stats'
  get '/staff', to: 'staff#index', as: 'staff'
  get '/users/:username', to: 'application#profile', as: 'profile'

  # Server shop

  get '/shop', to: 'application#shop', as: 'shop'

  # Support tickets

  resources :reports do
    put :close
    put :open
  end
  get '/support', to: 'reports#index'
end
