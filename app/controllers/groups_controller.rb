class GroupsController < ApplicationController 

  def index
    if params[:search] != nil && params[:search] != ""
      group = Group.search(params[:search])
      @products = group.first.products
    else 
      @products = Product.all
    end 
  end 

end 