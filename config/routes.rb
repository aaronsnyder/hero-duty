Rails.application.routes.draw do
  get '/', to: 'shifts#index'
  get '/shifts/', to: 'shifts#index'
  get '/shifts/:first_name', to: 'shifts#show', as: 'employee_shifts'
  get '/log_out', to: 'sessions#destroy', as: 'log_out'
  get '/log_in', to: 'sessions#new', as: 'log_in'
  get '/create_work_restriction/:employee_id/:date', to: 'work_restrictions#create', as: 'create_work_restriction'
  get '/destroy_work_restriction/:employee_id/:date', to: 'work_restrictions#destroy', as: 'destroy_work_restriction'
  get '/shift_swap/create/:original_shift_id/:new_shift_id', to: 'shift_swaps#create', as: 'create_shift_swap'
  get '/shift_swap/approve/:id', to: 'shift_swaps#approve', as: 'approve_shift_swap'
  
  resources :sessions
  resources :employees
end
