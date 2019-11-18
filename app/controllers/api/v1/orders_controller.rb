class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    render json: current_user.orders
  end

  def show
    render json: current_user.orders.find(params[:id])
  end

  def create 
    @order = current_user.orders.build(params)
    if @order.save
      render json: @order, status: 201, location: [:api, current_user, @order]
    else
      render json: { errors: @order.errors }, status: 422
    end 
  end 
end
