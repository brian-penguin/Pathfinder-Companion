Rails.application.routes.draw do
  root to: "home#show"
  get 'about', to: 'home#about'
  
  devise_for :users

  resources :users
  mount_ember_app :frontend, to: "/"
end