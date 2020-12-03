Rails.application.routes.draw do
  resources :ip_addresses
  # post 'home/index' => 'forms/new'
 # resources :forms

#  root 'home#index'

resources :passwords
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
