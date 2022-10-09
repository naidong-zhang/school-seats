Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "static_pages#home"
  get "/about", to: "static_pages#about", as: "about"
  resources :schools do
    collection do
      get :search
    end
  end
  resources :home_addresses
  resources :school_division_wards
  resources :wards
  resources :school_divisions
end
