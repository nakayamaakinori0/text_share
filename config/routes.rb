Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # TODO 複数形とか単数系とかキモいな
  resources :shared_texts, only: [:index, :create]
  get 'shared_texts/fetch_texts', to: 'shared_texts#fetch_texts', as: :fetch_texts

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "shared_texts#index"
end
