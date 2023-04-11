Rails.application.routes.draw do

  devise_for :users

  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/search', to: 'searches#search'

  # create group
  resources :groups, only: [:index, :show, :edit, :update, :new, :create] 
  resources :group_users, only: [:create, :destroy]
  resources :events, only: [:new, :create]
  get "events/comfirm/:id", to: "events#comfirm", as: "event_comfirm"
end
