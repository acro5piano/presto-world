Rails.application.routes.draw do
  resources :messages
  resources :students
  resources :teachers

  # Landing page
  root 'static_pages#index'
  get '/register', to: 'static_pages#index', as: 'register'
  get '/login', to: 'static_pages#index', as: 'login'
  get '/logout', to: 'static_pages#index', as: 'logout'
end
