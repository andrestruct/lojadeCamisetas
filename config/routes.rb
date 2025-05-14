Rails.application.routes.draw do
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :produtos, only: [ :new, :create, :destroy ]
  root "produtos#index"


  # # get "[o nome que queremos para a URL]" => "[nome do Controller]#[nome da página]"
  # get "produtos" => "produtos#index"

  # get "/produtos/new" => "produtos#new"
  # post "/produtos" => "produtos#create"

  # # get "/produtos/:id/remove" => "produtos#destroy"
  # delete "/produtos/:id" => "produtos#destroy", as: :produto

  # # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # # Defines the root path route ("/")
  # # root "posts#index"
end
