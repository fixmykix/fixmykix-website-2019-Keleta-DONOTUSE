require 'api_constraints'
Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  namespace :api, defaults: { format: :json }, 
            constraints:  { subdomain: 'api'}, path: '/' do 
    
    scope module: :v1, 
          constraints: ApiConstraints.new(version: 1, default: true) do 
      resources :users, :only => [:create, :show, :update, :destroy, :index] do 
        resources :products, :only => [:create, :update, :destroy, :index]
        resources :orders, :only => [:index, :show, :create]
      end 
      resources :sessions, :only => [:create, :destroy]
      resources :products, :only => [:show, :index, :create]
    end
  end
  resources :users
  root 'home#index'
end
