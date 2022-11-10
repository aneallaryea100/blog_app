Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [ :index, :new, :create, :show] 
    resources :comments, only: [ :create ]
    resources :likes, only: [ :create ]
  end

end
