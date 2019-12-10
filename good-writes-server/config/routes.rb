Rails.application.routes.draw do

  resources :users, only: [:show]
  resources :pieces, only: [:show, :create, :update]
  resources :groups, only: [:index]

  post '/signup' => 'users#create'
  post '/login' => 'sessions#create'

end
