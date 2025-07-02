Rails.application.routes.draw do
  root to: 'urls#new'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :urls, only: [:create, :show, :new]
  get '/:short', to: 'urls#redirect', as: :short
end
