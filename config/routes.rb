Rails.application.routes.draw do
  resources :messages
  resources :students
  resources :teachers

  # Landing page
  root 'static_pages#index'
  get '/register', to: 'teachers#new', as: 'register'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
end
