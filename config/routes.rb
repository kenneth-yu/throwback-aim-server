Rails.application.routes.draw do
  resources :chats, only: [:index, :create]
  resources :users, only: [:index, :show, :create]
  resources :messages, only: [:index, :create]
  resources :friendships, only: [:index, :create]
  resources :user_conversations, only: [:index, :create, :show]
  post '/login', to: 'auth#create'
  post '/signup', to: 'users#new'
  get '/profile', to: 'users#profile'
  get '/get_user', to: 'auth#show'
  mount ActionCable.server => '/cable'
end
