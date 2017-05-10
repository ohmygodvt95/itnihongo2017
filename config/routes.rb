Rails.application.routes.draw do

  get 'followers/index'

  get 'following/index'

  devise_for :users
  resources :images do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show] do
    resources :followers, only: [:index]
    resources :following, only: [:index]
  end

  resources :relationships, only: [:create, :destroy]
  resources :newsfeed, only: :index
  unauthenticated  do
    root "static_pages#show", act: "home"
  end

  authenticated  do
    root "home#index"
  end
  get "/pages/:act" => "static_pages#show"


end
