Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'users#index'

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments
        end
      end
    end
  end
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [ :index, :new, :create, :show, :destroy] 
    resources :comments, only: [ :create, :destroy]
    resources :likes, only: [ :create ]
  end

  

end
