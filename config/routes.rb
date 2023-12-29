Rails.application.routes.draw do
  resources :projects
    resource :users, only: [:create]
    post '/login', to: 'authentication#login'
end
