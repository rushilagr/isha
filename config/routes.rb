Rails.application.routes.draw do
  resources :participants
  root to: 'home#root'
  
  resources :programs
  resources :cities
  resources :centers
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    password: 'users/password' 
  }
  resources :users
  post 'users/create', to: 'users#create', as: :create_user
end
