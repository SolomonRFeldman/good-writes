Rails.application.routes.draw do

  resources :users, only: [:show]
  resources :pieces, only: [:show, :create, :update, :destroy]
  resources :groups, only: [:index, :show, :create, :update]
  resources :user_groups, only: [:create, :update, :destroy]
  resources :comments, only: [:create]

  post '/signup' => 'users#create'
  post '/login' => 'sessions#create'

end
