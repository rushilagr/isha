Rails.application.routes.draw do
  resources :programs
  root to: 'users/sessions#new'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    password: 'users/password' 
  }
end
