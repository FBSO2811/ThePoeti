Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get 'poetries', to: 'poetries#index', as: :poetries

  get "poetries/new", to: "poetries#new"
  post   "poetries",          to: "poetries#create"

  get "poetries/:id/edit", to: "poetries#edit"
  patch "poetries/:id", to: "poetries#update"

  get 'poetries/:id', to: 'poetries#show', as: :poetry

  delete "poetries/:id", to: "poetries#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
