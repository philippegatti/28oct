Rails.application.routes.draw do
  get 'city/show'
  resources :gossip, except: [:destroy] 
  resources :author
  resources :welcome, only: [:index, :show]
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :city, except: [:destroy] 
  root 'welcome#index'
end
