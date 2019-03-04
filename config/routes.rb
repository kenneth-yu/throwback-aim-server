Rails.application.routes.draw do
  resources :chats, only: [:index, :create]
  resources :users, only: [:index, :show, :create, :new]
  resources :messages, only: [:index, :create]
  post '/login', to: 'auth#create'
  post '/signup', to: 'users#new'
  get '/profile', to: 'users#profile'
  mount ActionCable.server => '/cable'
end
