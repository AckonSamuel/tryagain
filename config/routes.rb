# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :events
  # # default_url_options host: 'localhost', port: '3000'
  # resources :posts

  devise_for :clubs, path: 'auth/clubs/', path_names: {
                                                                         sign_in: 'login',
                                                                         sign_out: 'logout',
                                                                         registration: 'signup',
                                                                         password: 'password',
                                                                       },
                     controllers: {
                       sessions: 'clubs/sessions',
                       registrations: 'clubs/registrations',
                       confirmations: 'clubs/confirmations',
                       passwords: 'clubs/passwords',
                     }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  concern :base_api do
    post 'clubs/register', to: 'clubs#register'
    post 'clubs/login', to: 'clubs#login'
  end

  namespace :v1 do
    concerns :base_api
  end

  resources :clubs
  post '/clubs/:club_id/club_executives', to: 'club_executives#create'
  patch '/clubs/:club_id/club_executives/:executive_id', to: 'club_executives#update'
  get '/clubs/:club_id/club_executives', to: 'club_executives#index'
  get '/clubs/:club_id/club_executives/:executive_id', to: 'club_executives#show'
  delete '/clubs/:club_id/club_executives/:executive_id', to: 'club_executives#destroy'
  # Defines the root path route ("/")
end
