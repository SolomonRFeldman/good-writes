Rails.application.routes.draw do

  resources :users, only: [:show]
  resources :pieces, only: [:show]
  resources :groups, only: [:index]

  post '/signup' => 'users#create'
  post '/login' => 'sessions#create'

end
