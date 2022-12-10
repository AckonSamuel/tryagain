# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :clubs
  # resources :clubs
  # resources :staffs
  # resources :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'clubs#register'
end
