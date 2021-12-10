Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Blazer::Engine, at: "blazer"
  # devise_for :users
  scope defaults: (Rails.env.production? ? { protocol: 'https' } : {}) do
    devise_for :users
  end
  # scope defaults: (Rails.env.development? ? { protocol: 'https' } : {}) do
  #   devise_for :users
  # end
  root 'home#index'
  resources :home
  resources :quotes
  # get 'interventions/index'
  resources :interventions
  get 'intervention', to: 'interventions#index'
  get 'quote', to: 'quotes#new'
  get 'commercial', to: 'home#commercial'
  get 'residential', to: 'home#residential'
  get 'map', to: 'map#index'
  get 'dropbox/auth' => 'dropbox#auth'
  get 'dropbox/auth_callback' => 'dropbox#auth_callback'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end