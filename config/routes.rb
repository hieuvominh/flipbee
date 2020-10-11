# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  match '*path', to: 'application#cors_preflight_check', via: [:options]
  namespace :api do
    namespace :v1 do
      resources :cards
      resources :collections
      resources :users, param: :_username
      post 'auth/login', to: 'authentication#login'
    end
  end
end
