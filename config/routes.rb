HelpMe::Application.routes.draw do

root to: "users#index"
post '/users/login', to: 'users#login', as: :facebook_login
resources :users

end
