Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users do
    resources :friend_requests
  end
  # get '/users/', to: 'people#index'
  # get '/users/:id', to: 'people#show'
  resources :posts do
    resources :comments
    resources :likes
  end
  resources :comments do
    resources :comments
    resources :likes
  end
  get '/friend_requests/accept/:user_id', to: 'friend_requests#accept', as: 'accept_request'
  #post 'posts/:post_id/comments/:id', to: 'comments#create', as: 'comment_comments'
  
  # Defines the root path route ("/")
  # root "articles#index"
end
