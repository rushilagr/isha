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


  # Participants dashboard
  match 'call_tasks/:id/participants', to: 'call_tasks#participants', as: 'call_task_participants', via: [:get, :post, :put, :delete]
  # Destroy Participants
  post 'call_tasks/:id/participants/destroy', to: 'call_tasks#participants_destroy', as: 'call_task_participants_destroy'


  # Callers dashboard
  get 'call_tasks/:id/callers', to: 'call_tasks#callers', as: 'call_task_callers'
  # Add / Remove Callers
  match 'call_tasks/:id/callers/:c_id', to: 'call_tasks#caller_toggle', as: 'edit_call_task_caller', via: [:delete, :put]
  ## Confirm Callers
  post 'call_tasks/:id/callers/confirm', to: 'call_tasks#callers_confirm', as: 'call_task_callers_confirm'
  # New users creating
  get 'call_tasks/:id/new_users', to: 'call_tasks#new_users', as: 'call_task_new_users'


  # Max calls per caller
  match 'call_tasks/:id/limit', to: 'call_tasks#limit', as: 'call_task_limit', via: [:get, :post]


  # Review
  get 'call_tasks/:id/review', to: 'call_tasks#review', as: 'call_task_review'
  # Review Confirm
  post 'call_tasks/:id/review_confirm', to: 'call_tasks#review_confirm', as: 'call_task_review_confirm'


  ## -----------------------------------------------
end
