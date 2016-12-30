Rails.application.routes.draw do
  resources :messages
  resources :students
  resources :users

  # Landing page
  root 'static_pages#index'
end
