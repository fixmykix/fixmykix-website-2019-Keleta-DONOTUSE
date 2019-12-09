class ProductsController < ApplicationController 
  before_action :authenticate_user!, except: [:show]
  layout 'slim'
  def index 
  end 

  def search 
    @products = Product.search(params[:search])
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