# frozen_string_literal: true

Rails.application.routes.draw do
  get 'private/test'
  devise_for :students, 
    path: '', 
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'students/sessions',
      registrations: 'students/registrations'
    }
  # devise_for :staffs
  # devise_for :students
  # devise_for :clubs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  concern :base_api do
    post 'staffs/register', to: 'staffs#register'
    post 'students/register', to: 'students#register'
    post 'clubs/register', to: 'clubs#register'

    post 'staffs/login', to: 'staffs#login'
    post 'students/login', to: 'students#login'
    post 'clubs/login', to: 'clubs#login'
  end

  namespace :v1 do
    concerns :base_api
  end
  # Defines the root path route ("/")
end
