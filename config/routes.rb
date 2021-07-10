Rails.application.routes.draw do
  resources :couriers

  root 'pages#index'
end
