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

  ## -----------------------------------------------
  ## Call Task
  ## -----------------------------------------------

  resources :call_tasks

  # CT Callers dashboard
  get 'call_tasks/:id/callers', to: 'call_tasks#callers', as: 'call_task_callers'
  # CT Add / Remove Callers
  match 'call_tasks/:id/callers/:c_id', to: 'call_tasks#caller_toggle', as: 'edit_call_task_caller', via: [:delete, :put]

  # CT Participants dashboard
  match 'call_tasks/:id/participants', to: 'call_tasks#participants', as: 'call_task_participants', via: [:get, :post]
  # CT Destroy Participants
  post 'call_tasks/:id/participants/destroy', to: 'call_tasks#participants_destroy', as: 'call_task_participants_destroy'

  ## -----------------------------------------------
end
