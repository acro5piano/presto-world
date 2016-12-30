Rails.application.routes.draw do
  resources :messages
  resources :students
  resources :teachers

  # Landing page
  root 'static_pages#index'
end
