Rails.application.routes.draw do

  root to: 'home#root'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    password: 'users/password'
  }
  resources :users
  post 'users/create', to: 'users#create', as: 'create_user'

  resources :centers

  get 'participants', to: 'participants#index', as: 'participants'
  get 'participants/:id', to: 'participants#show', as: 'participant'

  match 'admin/import_participants', to: 'admin#import_participants', as: 'admin_import_participants', via: [:get, :post]
  match 'admin/import_pin_codes', to: 'admin#import_pin_codes', as: 'admin_import_pin_codes', via: [:get, :post]

  resources :call_tasks
end
