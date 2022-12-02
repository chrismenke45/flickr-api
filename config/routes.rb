Rails.application.routes.draw do
  resources :searches, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "searches#index"
end
