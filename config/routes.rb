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
  get '/top-rated', :to => 'users#index'
  resources :users
  resources :orders
  root 'home#index'    

  get '/checkout/new' => 'orders#new_card', as: :add_payment_method
  post "/card" => "orders#create_card", as: :create_payment_method
  get '/success' => 'orders#success', as: :success
end
