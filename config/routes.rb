Rails.application.routes.draw do
  get '/couriers', to: 'couriers#index'

  root 'pages#index';
end
