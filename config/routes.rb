Rails.application.routes.draw do

  root 'application#index'

  resources :users, only: [:index, :show]
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#delete'

  resources :groups do
    resources :user_groups, only: [:create, :destroy, :edit, :update]
  end

  

end
