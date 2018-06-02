Rails.application.routes.draw do
  root to: 'home#root'

  get 'programs/registrable', to: 'programs#registrable', as: 'program_registrable'
  get 'programs/attendanceable', to: 'programs#attendanceable', as: 'program_attendanceable'
  get 'programs/:id/attendance', to: 'programs#attendance', as: 'program_attendance'
  post 'programs/:id/attendance/toggle', to: 'programs#attendance_toggle', as: 'program_attendance_toggle'
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
