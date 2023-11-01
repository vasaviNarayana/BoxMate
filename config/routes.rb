# config/routes.rb

Rails.application.routes.draw do
  # Chef routes
  namespace :chefs do
    get 'signup', to: 'registrations#new'
    post 'signup', to: 'registrations#create'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    get 'dashboard', to: 'dashboard#index'
    # Additional chef routes can be defined here
  end

  # Customer routes
  namespace :customers do
    get 'signup', to: 'registrations#new'
    post 'signup', to: 'registrations#create'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    get 'dashboard', to: 'dashboard#index'
    # Additional customer routes can be defined here
  end

  # Shared routes
  root 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'contact', to: 'welcome#contact'

  # Define any other shared or global routes here

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
