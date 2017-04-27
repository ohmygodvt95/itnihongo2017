Rails.application.routes.draw do
  devise_for :users
  root "static_pages#show", act: "home"
  get "/pages/:act" => "static_pages#show"
end
