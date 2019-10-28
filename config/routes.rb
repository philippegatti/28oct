Rails.application.routes.draw do
  get 'author/:id/', to: 'author#show', as: :author_id
  get 'author/', to: 'author#show'
  get 'gossip/:id/', to: 'gossip#show', as: :gossip_id
  get 'gossip/', to: 'welcome#show'
  get '/', to: 'welcome#show'
  get 'welcome/', to: 'welcome#show'
  get 'welcome/:id/', to: 'welcome#show'
  get 'contact/', to: 'contact#show'
  get 'team/', to: 'team#show'
  get 'message/show'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
