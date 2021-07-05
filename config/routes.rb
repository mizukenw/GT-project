Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'
  get '/users/:id', to:'users#show', as:'user'

  resources :posts, only: %i(new create index) do
    resources :movies, only: %i(create)
  end 
end
