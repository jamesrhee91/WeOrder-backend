Rails.application.routes.draw do
  resources :user_restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      # resources :restaurants
      get '/restaurants', to: 'restaurants#index'
      post '/restaurants', to: 'restaurants#index'
      # post '/login', to: 'auth#create'
      # get '/me', to: 'users#me'
      # get '/todos', to: 'todos#index'
    end
  end
end
