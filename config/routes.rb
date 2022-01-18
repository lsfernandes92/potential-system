Rails.application.routes.draw do
  resources :kinds
  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'relationships/kind'

    resource :address, only: [:show, :create, :update, :destroy]
    resource :address, only: [:show, :create, :update, :destroy], path: 'relationships/address'

    resource :phones, only: [:show]
    resource :phones, only: [:show], path: 'relationships/phones'

    resource :phone, only: [:update, :create, :destroy]
    resource :phone, only: [:update, :create, :destroy], path: 'relationships/phone'
  end
end
