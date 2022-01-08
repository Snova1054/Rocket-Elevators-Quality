Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Blazer::Engine, at: "blazer"
  root 'home#index'
  resources :home
  devise_for :users
  resources :quotes
  resources :interventions
  resources :machine_learning
  get 'intervention', to: 'interventions#index'
  get 'quote', to: 'quotes#new'
  get 'commercial', to: 'home#commercial'
  get 'residential', to: 'home#residential'
  get 'map', to: 'map#index'
  get 'dropbox/auth' => 'dropbox#auth'
  get 'dropbox/auth_callback' => 'dropbox#auth_callback'
  get 'machine_learning', to: 'machine_learning#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end