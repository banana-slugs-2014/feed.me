HelpMe::Application.routes.draw do


  # The priority is based upon order of creation:
  # first created -> highest priority.
  root to: "users#index"
  resources :places, only: [:create]
  resources :recommendations, only: [:update]

  post '/login', to: 'users#create', as: :login
  delete '/logout', to: 'sessions#destroy', as: :logout
  resources :users, only: [:update]
  mount Split::Dashboard, :at => 'split'
end
