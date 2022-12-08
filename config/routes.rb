Rails.application.routes.draw do
  resources :executives
  resources :patrons
  resources :club_staffs
  resources :club_students
  resources :clubs
  resources :staffs
  resources :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
