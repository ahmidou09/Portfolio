Rails.application.routes.draw do
  resources :projects
  resources :users, only: [:index, :show, :create, :update, :destroy]
  post '/login', to: 'authentication#login'
  post '/logout', to: 'authentication#logout'
end
