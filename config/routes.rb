
HelpMe::Application.routes.draw do


  root to: "users#index"
  # post '/places' => 'places#create'
  # get  '/places' => 'places#index', as: :places
  # get  '/places/:id' => 'places#show', as: :places_path
  resources :places, only: [:index, :create, :show]
  # The priority is based upon order of creation:
  # first created -> highest priority.

  post '/login', to: 'sessions#create', as: :login
  delete '/logout', to: 'sessions#destroy', as: :logout
  resources :users, only: [:update]
end
