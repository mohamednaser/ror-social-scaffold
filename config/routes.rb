Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :friend_requests, only: [:create,:index]

  post "invitation/accept", to: "friend_requests#accept"
  post "invitation/reject", to: "friend_requests#reject"
  post "invitation/cancel", to: "friend_requests#cancel"

  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
