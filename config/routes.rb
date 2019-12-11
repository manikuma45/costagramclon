Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :messages
  resources :favorites, only: [:index, :create, :destroy]
  root to: "messages#index"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
