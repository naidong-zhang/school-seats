Rails.application.routes.draw do
  resources :schools
  resources :home_addresses
  resources :school_division_wards
  resources :wards
  resources :school_divisions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
