
HelpMe::Application.routes.draw do


  root :to => 'users#index'
  post '/places' => 'places#create'
  get  '/places' => 'places#index', as: :places
  get  '/places/:id' => 'places#show', as: :places_path
  # The priority is based upon order of creation:
  # first created -> highest priority.

  root to: "users#index"
  post '/login', to: 'sessions#create', as: :login
  delete '/logout', to: 'sessions#destroy', as: :logout
  resources :users

end
