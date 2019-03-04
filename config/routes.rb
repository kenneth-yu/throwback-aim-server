Rails.application.routes.draw do
  resources :chats, only: [:index, :create]
  resources :users, only: [:index, :show, :create]
  resources :messages, only: [:index, :create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  mount ActionCable.server => '/cable'
end
