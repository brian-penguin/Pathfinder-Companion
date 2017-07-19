Rails.application.routes.draw do
  devise_for :users
  resources :users
  mount_ember_app :frontend, to: "/"
end