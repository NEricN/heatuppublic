Rails.application.routes.draw do
  resources :user

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # basic
  root "pages#home"
  get "/home", to: "pages#home"
  get "/top", to: "pages#top"
  get "/tos", to: "pages#tos", :as => :tos

  get "/songs/play", to: "songs#play"
  get "/users/songs", to: "user#songs", :as => :playlist

  post "/songs/vote", to: "songs#vote", :as => :vote
  post "/songs/upload", to: "songs#upload", :as => :upload
end
