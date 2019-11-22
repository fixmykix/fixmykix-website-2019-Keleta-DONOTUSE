class Api::V1::ChargesController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def index
   @user_email = current_user.email
   render json: @user_email
  end

    
end
