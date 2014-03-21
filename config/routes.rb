HelpMe::Application.routes.draw do

root to: "users#index"
post '/login', to: 'sessions#create', as: :login
delete '/logout', to: 'sessions#destroy', as: :logout
resources :users

end
