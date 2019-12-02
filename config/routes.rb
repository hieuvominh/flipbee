Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  namespace :api do
    namespace :v1 do
      resources :cards
      resources :collections
      resources :users, param: :_username
      post 'auth/login', to: 'authentication#login'
    end
  end
  
end
