Rails.application.routes.draw do
  root to: 'urls#index'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :urls, only: [:create, :show, :new, :index]
  get '/:short', to: 'urls#redirect', as: :short
end
