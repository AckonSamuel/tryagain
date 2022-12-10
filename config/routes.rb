# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :executives
  resources :patrons
  resources :club_staffs
  resources :club_students
  resources :clubs
  resources :staffs
  resources :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'clubs#index'
  post 'users/register', to: 'users#register'
end
