Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/paperFiles", to: 'home#paperFiles', as: 'paperFiles'
  get "/patagonia", to: 'home#patagonia', as: 'patagonia'
  get "/acme", to: 'home#acme', as: 'acme'
  post "/data", to: 'home#data', as: 'data'
  get "/destroy", to: 'home#destroy', as: 'destroy'

  # Defines the root path route ("/")
  root "home#index"
end
