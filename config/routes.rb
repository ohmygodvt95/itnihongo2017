Rails.application.routes.draw do

  devise_for :users
  resources :images
  resources :users, only: [:show]

  unauthenticated  do
    root "static_pages#show", act: "home"
  end

  authenticated  do
    root "home#index"
  end
  get "/pages/:act" => "static_pages#show"


end
