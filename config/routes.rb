Rails.application.routes.draw do
  mount Forem::Engine, :at => '/forums'
  root 'home#index'
  devise_for :users

  resources :servers

  get '/info/terms', to: 'home#terms', as: 'terms'
  get '/info/rules', to: 'home#rules', as: 'rules'

  get '/stats', to: 'stats#index', as: 'stats'
end
