Rails.application.routes.draw do

  resources :users, only: [:show]
  resources :pieces, only: [:show, :create, :update, :destroy]
  resources :groups, only: [:index, :show, :create]
  resources :user_groups, only: [:create, :update, :destroy]

  post '/signup' => 'users#create'
  post '/login' => 'sessions#create'

end
