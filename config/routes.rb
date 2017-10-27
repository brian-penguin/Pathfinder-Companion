Rails.application.routes.draw do
  root to: 'home#show'

  resources :spells
end
