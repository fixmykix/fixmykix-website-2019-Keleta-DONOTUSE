class ProductsController < ApplicationController 
  before_action :authenticate_user!

  def index 
  end 

  def show
    @product = Product.find(params[:id]) 
  end 

  def new 
  end 

  def create 
  end 

  private 
   
  def product_params
  end 

end 