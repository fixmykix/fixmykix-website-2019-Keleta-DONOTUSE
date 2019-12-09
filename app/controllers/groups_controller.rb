class GroupsController < ApplicationController 
  before_action :authenticate_user!
  def index
    if params[:search] != nil && params[:search] != ""
      group = Group.search(params[:search])
      if group.any?
        @products = group.first.products
      end 
    else
      byebug 
      @products = Product.all
    end 
  end 

end 