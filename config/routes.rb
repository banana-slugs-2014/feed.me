HelpMe::Application.routes.draw do

root to: "users#index"
post '/login', to: 'sessions#create', as: :login
post '/logout', to: 'sessions#delete', as: :logout
resources :users

end
