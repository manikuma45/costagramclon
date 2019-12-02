Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
