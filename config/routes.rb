Rails.application.routes.draw do
  resources :messages
  resources :students
  resources :users

  # Landing page
  root 'static_pages#index'
  get '/about', to: 'static_pages#about', as: 'about'

  get '/register', to: 'users#new', as: 'register'
  get '/register_with_facebook', to: 'users#register_with_facebook'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
end
