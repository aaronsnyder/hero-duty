Rails.application.routes.draw do
  get '/shifts/', to: 'shifts#index'
  get '/shifts/:first_name', to: 'shifts#show'
end
