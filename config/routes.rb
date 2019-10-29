Rails.application.routes.draw do
  resources :gossip, except: [:destroy] 
  resources :author
  resources :welcome, only: [:index, :show]
  resources :contact, only: [:index]
  resources :team, only: [:index]
end
