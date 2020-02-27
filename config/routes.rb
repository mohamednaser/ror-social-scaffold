Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]

  post "invitation/send", to: "friends#create"
  post "invitation/accept", to: "friends#accept"
  post "invitation/cancel", to: "friends#cancel"
  
  get "friends/pending", to: "friends#pending"


  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
