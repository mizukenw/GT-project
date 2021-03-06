Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users

  root to: 'posts#index'
  get '/users/:id', to:'users#show', as:'user'

  resources :posts, only: %i(new create index show destroy) do
    resources :movies, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end 
end
