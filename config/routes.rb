# frozen_string_literal: true

Rails.application.routes.draw do
  resources :messages
  devise_for :admins, path: 'auth/admin', path_names: {
                                            sign_in: 'login',
                                            sign_out: 'logout',
                                            registration: 'signup',
                                            password: 'password'
                                          },
                     controllers: {
                       sessions: 'admins/sessions',
                       registrations: 'admins/registrations',
                       confirmations: 'admins/confirmations',
                       passwords: 'admins/passwords'
                     }
  get '/admin/:admin_id/clubs', to: 'admins#index'
  get '/admin/:admin_id/clubs/:club_id', to: 'admins#show_club'
  get '/admin/:admin_id', to: 'admins#show_admin'
  post '/admin/:admin_id/set_year', to: 'admins#set_year'
  post '/admin/:admin_id/setfees', to: 'admins#set_fees'
  patch '/admin/:admin_id/approve_club/:club_id', to: 'admins#approve_club'
  delete '/admin/:admin_id/delete_application/:club_id', to: 'admins#delete_application'
  
  # resources :events
  # # default_url_options host: 'localhost', port: '3000'
  # resources :posts

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # concern :base_api do
  #   post 'clubs/register', to: 'clubs#register'
  #   post 'clubs/login', to: 'clubs#login'
  # end

  # namespace :v1 do
  #   concerns :base_api
  # end
  # Defines the root path route ("/")

  devise_for :clubs, path: 'auth/clubs/', path_names: {
                                            sign_in: 'login',
                                            sign_out: 'logout',
                                            registration: 'signup',
                                            password: 'password'
                                          },
                     controllers: {
                       sessions: 'clubs/sessions',
                       registrations: 'clubs/registrations',
                       confirmations: 'clubs/confirmations',
                       passwords: 'clubs/passwords'
                     }

  resources :clubs
  post '/clubs/:club_id/club_executives', to: 'club_executives#create'
  patch '/clubs/:club_id/club_executives/:executive_id', to: 'club_executives#update'
  get '/clubs/:club_id/club_executives', to: 'club_executives#index'
  get '/clubs/:club_id/club_executives/:executive_id', to: 'club_executives#show'
  delete '/clubs/:club_id/club_executives/:executive_id', to: 'club_executives#destroy'
end
