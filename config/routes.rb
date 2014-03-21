
HelpMe::Application.routes.draw do


  root :to => 'places#index'
  post '/create' => 'places#create'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  root to: "users#index"
  post '/login', to: 'sessions#create', as: :login
  delete '/logout', to: 'sessions#destroy', as: :logout
  resources :users

end
