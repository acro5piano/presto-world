Rails.application.routes.draw do
  resources :users
  resources :messages

  # Landing page
  root 'static_pages#index'
  get '/about', to: 'static_pages#about', as: 'about'
  get '/company', to: 'static_pages#company', as: 'company'
  get '/user_terms', to: 'static_pages#user_terms', as: 'user_terms'

  get '/profile', to: 'users#edit'

  get '/register_with_facebook', to: 'users#register_with_facebook'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
end
