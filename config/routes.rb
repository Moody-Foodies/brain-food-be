
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'recipes', to: 'recipes#index'
    end
  end
end