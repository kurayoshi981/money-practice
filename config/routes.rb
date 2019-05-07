Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :product, only: %i(index new create)
end
