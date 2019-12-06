Rails.application.routes.draw do
  post '/login' => 'sessions#create'
end
