Rails.application.routes.draw do
  root to: 'home#root'

  get 'programs/registrable', to: 'programs#registrable', as: 'program_registrable'
  resources :programs

  resources :cities
  resources :centers
  resources :participants

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    password: 'users/password'
  }
  resources :users
  post 'users/create', to: 'users#create', as: 'create_user'
end
