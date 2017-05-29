Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :skits, only: [ :index, :show ]
  resources :users, only: [ :show, :edit, :update ]
  resources :playlists, only: [ :index, :show, :create, :update, :destroy ]
  resources :playlist_skits, only: [ :create, :update, :destroy ]
  resources :artists, only: :show
  resources :reviews, only: [ :create, :update, :destroy ]
end
