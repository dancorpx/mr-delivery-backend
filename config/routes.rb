Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: 'login#login'
      resources :packages, only: [ :index, :show, :update, :create, :destroy ] do
        collection do
          get :available
          get :accepted
          get :completed
        end
      end
      resources :deliveries, only: [ :index, :show, :update, :create, :destroy ] do
        collection do
          get :accepted
          get :completed
        end
      end
      resources :users, only: [:update]
    end
  end
end

