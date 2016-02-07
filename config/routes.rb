Rails.application.routes.draw do
  get '/', to: 'shifts#index'
  
  get '/shifts/', to: 'shifts#index'
  get '/shifts/:first_name', to: 'shifts#show', as: 'employee_shifts'
  get '/shifts/pickup/:id', to: 'shifts#pickup', as: 'pickup_shift'
  
  get '/log_out', to: 'sessions#destroy', as: 'log_out'
  get '/log_in', to: 'sessions#new', as: 'log_in'
  
  get '/work_restriction/create/:employee_id/:date', to: 'work_restrictions#create', as: 'create_work_restriction'
  get '/work_restriction/destroy/:employee_id/:date', to: 'work_restrictions#destroy', as: 'destroy_work_restriction'
  
  get '/shift_swap/create/:original_shift_id/:new_shift_id', to: 'shift_swaps#create', as: 'create_shift_swap'
  get '/shift_swap/approve/:id', to: 'shift_swaps#approve', as: 'approve_shift_swap'
  get '/shift_swap/auto_swap/:id', to: 'shift_swaps#autoSwap', as: 'auto_shift_swap'
  
  get '/admin_actions/', to: 'admin_actions#index'
  get '/admin_actions/regenerate_schedules', to: 'admin_actions#regenerateSchedules', as: 'admin_actions_regenerate_path'
  get '/admin_actions/generate_schedules', to: 'admin_actions#generateSchedules', as: 'admin_actions_generate_path'
  
  resources :sessions
  resources :employees
end
