Rails.application.routes.draw do

  resources :groups, only: [:index]
  resources :users, only: [:show]

  post '/signup' => 'users#create'
  post '/login' => 'sessions#create'

end
