Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get 'pages/about', to: 'pages#about', as: :about
  get 'pages/newsletter', to: 'pages#newsletter', as: :newsletter
  get 'pages/disclaimer', to: 'pages#disclaimer', as: :disclaimer


  get 'poetries', to: 'poetries#index', as: :poetries
  get "poetries/new", to: "poetries#new"
  post   "poetries", to: "poetries#create"
  get "poetries/:id/edit", to: "poetries#edit", as: :poetries_edit
  patch "poetries/:id", to: "poetries#update"
  get 'poetries/:id', to: 'poetries#show', as: :poetry
  delete "poetries/:id", to: "poetries#destroy"

  get "/amateur_poetries", to: "poetries#amateur_poetries"
  get "/famous_poetries", to: "poetries#famous_poetries"

  # get "poetries/user_poetries", to: "poetries#user_poetries"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
