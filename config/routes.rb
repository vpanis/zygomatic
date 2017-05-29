Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :skits, only: [ :index, :show ]
  resources :users, only: [ :show, :edit, :update ]
  resources :playlists, only: [ :index, :show, :create, :update, :delete ]
  resources :playlist_skits, only: [ :create, :update, :delete ]
  resources :artists, only: :show
  resources :reviews, only: [ :create, :update, :delete ]
end
