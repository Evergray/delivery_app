Rails.application.routes.draw do
  resources :couriers do
    resources :packages, only: %i[create destroy]

    resources :packages do
      put:activate, on: :member 
    end
  end

  root 'pages#index'
end
