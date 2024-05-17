
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'recipes', to: 'recipes#index'
      namespace :recipes do
        resources :favorites, only: [:index, :create, :destroy]
      end
    end
  end
end