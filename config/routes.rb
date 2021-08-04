Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # shirts Routes
      resources :shirts, only: [:index, :create, :destroy, :update, :show]

      # user Routes
      resources :users, only: [:index, :create, :destroy, :update]

      # user login Route
      post 'login', to: 'authentication#create'

      # Favourte Routes
      get 'favourites', to: 'favourites#index'
      get 'my_favourites', to: 'favourites#show'
      post 'shirts/:id/favourites', to: 'favourites#create'
    end
  end
end
