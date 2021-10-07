Rails.application.routes.draw do
  resources :entries
  resources :journals
  resources :users
  
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/me", to:"users#show"
  post "/sign_up", to: "users#create"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
