Rails.application.routes.draw do
  get 'city/show'
  resources :gossip do
  	resources :comment
  end
  resources :author
  resources :welcome, only: [:index, :show]
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :city, except: [:destroy] 
  root 'welcome#index'
end
