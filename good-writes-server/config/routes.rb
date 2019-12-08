Rails.application.routes.draw do

  resources :groups, only: [:index]

  post '/signup' => 'users#create'
  post '/login' => 'sessions#create'

end
