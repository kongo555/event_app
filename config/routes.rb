Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :v1 do
    devise_for :users, only: [:api]
    resources :events
    resources :participants, only: [:index, :create]
  end
end
