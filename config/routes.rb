Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :profils, only: [ :index, :show, :new, :create, :destroy] do
    member do
      get "preferences", to: "preferences#create_preferences", as: "create_preferences"
      patch "update", to: "profils#update", as: 'update_profil'
      patch "update_profil_restrictions", to: "profils#update_profil_restrictions", as: "update_profil_restrictions_profil"
    end
  end
  # resources :profils, only: [:index, :show] do
  #   resources :recipes, only: [:index]
  # end
  resources :recipes, only: [:show, :index, :create]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
