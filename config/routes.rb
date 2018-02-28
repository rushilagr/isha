Rails.application.routes.draw do
  resources :programs
  root to: 'programs#index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    password: 'users/password' 
  }
end
