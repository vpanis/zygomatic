Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :skits, only: [ :index, :show ] do
    resources :reviews, only: [ :create, :update, :destroy ]
    resources :playlist_skits, only: [ :create ]
  end
  resources :users, only: [ :show, :edit, :update ]
  resources :playlists, only: [ :index, :show, :create, :update, :destroy ]
  get '/playlists/:playlist_id/skits/:id', to: 'playlists#launch', as: 'launch'
  resources :playlist_skits, only: [ :create, :update, :destroy ]
  resources :artists, only: :show

end
