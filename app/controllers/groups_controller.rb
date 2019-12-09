class GroupsController < ApplicationController 
  def index
    if params[:search] != nil && params[:search] != ""
      group = Group.search(params[:search])
      if group.any?
        @products = group.first.products
      end 
    else
      @products = Product.all
    end 
  end 

end 