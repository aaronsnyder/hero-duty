Rails.application.routes.draw do
  get '/', to: 'shifts#index'
  get '/shifts/', to: 'shifts#index'
  get '/shifts/:first_name', to: 'shifts#show', as: 'employee_shifts'
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  
  resources :sessions
  resources :employees
end
