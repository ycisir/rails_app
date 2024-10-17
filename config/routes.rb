Rails.application.routes.draw do
  resources :products
  get "users/list_users"
  get "users/show_new_template"
  get "users/display_other_template"
  get "users/new_user"
  post "/users/create_user"
  get "users/show/:id", to: "users#show", as: "show_user" # parameterized route


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  root "users#list_users"

end
