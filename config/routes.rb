Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :urls, only: [:create, :show]
  get '/:short', to: 'urls#redirect', as: :short
end
