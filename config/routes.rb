Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders, only: [:index]
  resources :invoices, only: [:index]
  resources :products, only: [:index, :new, :create]
end
