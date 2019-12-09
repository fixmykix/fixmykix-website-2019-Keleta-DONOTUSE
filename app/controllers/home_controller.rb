class HomeController < ApplicationController
  layout 'application'
  def index
    @groups = Group.all
  end
end
