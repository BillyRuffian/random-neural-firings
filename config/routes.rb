Rails.application.routes.draw do
  devise_for :users

  resources :notes

  # resources :users do 
  #   resources :notes
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "notes#index"
end
