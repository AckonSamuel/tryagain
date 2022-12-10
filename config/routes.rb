# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :students
  devise_for :clubs
  devise_for :users
  # resources :clubs
  # resources :staffs
  # resources :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'clubs#index'
end
