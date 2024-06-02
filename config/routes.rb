
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'login', to: 'sessions#create'
      delete 'logout', to: 'sessions#destroy'
      post 'recipes', to: 'recipes#index'
      resources :users, only: [:index, :create, :destroy, :update]
      namespace :recipes do
        resources :favorites, only: [:index, :create]
        delete "favorites", to: "favorites#destroy"
      end
    end
  end
end