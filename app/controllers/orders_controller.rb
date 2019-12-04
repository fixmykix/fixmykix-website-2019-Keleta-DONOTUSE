class OrdersController < ApplicationController 

  def show 
    @order = Order.find(params[:id])
  end 

  def new 
    @order = Order.new
  end 

  def create 
  end 

  private 

  def order_params 
  end 

end
