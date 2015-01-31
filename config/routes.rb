Rails.application.routes.draw do
  get 'reports/show'

  get 'reports/new'

  get 'reports/index'

  mount Forem::Engine, :at => '/forums'
  root 'home#index'
  devise_for :users

  resources :servers

  get '/info/terms', to: 'home#terms', as: 'terms'
  get '/info/rules', to: 'home#rules', as: 'rules'

  get '/stats', to: 'stats#index', as: 'stats'
  get '/shop', to: 'application#shop', as: 'shop'

  resources :reports do
    put :close
    put :open
  end
  get '/support', to: 'reports#index'

  get '/staff', to: 'staff#index', as: 'staff'

  get '/users/:username', to: 'application#profile', as: 'profile'
end
