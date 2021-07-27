Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :shirts, only: [:index, :create, :destroy, :update]
      resources :users, only: [:index, :create, :destroy, :update]
      resources :favourites, only: [:index, :create, :destroy, :update]
      post 'login', to: 'authentication#create'
    end
  end
end
