Rails.application.routes.draw do
  get '/hello', to: 'first#hello'
  get '/hi', to: 'first#hi'
  get '/current_user_info', to: 'users#current_user_info'
  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  # delete '/users/:id', to: 'users#destroy'
  # patch '/users/:id', to: 'users#update'
  resources :users
  resources :records
  delete 'sessions', to: 'sessions#destroy'
  resources :sessions, only: [:create]
end
