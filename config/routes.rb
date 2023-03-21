Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'

  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#create'
  get '/signup', to: 'users#new', as: 'signup'
  resources :users, only: [:create]
end
