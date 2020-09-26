Rails.application.routes.draw do
  get '/hello', to: 'first#hello'
  get '/hi', to: 'first#hi'

  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  # delete '/users/:id', to: 'users#destroy'
  # patch '/users/:id', to: 'users#update'
  resources :users
  resources :sessions, only: [:create, :destroy]
end
