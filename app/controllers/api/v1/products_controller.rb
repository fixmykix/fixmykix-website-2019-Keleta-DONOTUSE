module Api
  module V1
    class ProductsController < ApplicationController
      respond_to :json

      def index 
        render json: Product.all
      end 

      def show
        render json: Product.find(params[:id])
      end 

    end
  end 
end