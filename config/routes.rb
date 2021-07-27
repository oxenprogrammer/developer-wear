Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :shirts, only: [:index, :create, :destroy, :update]
      resources :users, only: [:index, :create, :destroy, :update]
    end
  end
end
