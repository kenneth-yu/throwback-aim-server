Rails.application.routes.draw do
  resources :chats, only: [:index, :create]
  resources :users, only: [:index, :show, :create]
  resources :messages, only: [:index, :create]
  mount ActionCable.server => '/cable'
end
