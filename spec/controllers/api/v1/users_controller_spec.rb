require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  
  before(:each) { request.headers['accept'] = "application/vnd.fixmykix.v1" }
  
  describe 'get users #show action' do 
    before(:each) do 
      @user = FactoryGirl.create :user 
      get :show, params: { id: @user.id }, format: :json
    end 

    it 'should return user info' do 
      user_response = JSON.parse(response.body, symbolize_names: true)

      expect(user_response[:email]).to eql(@user.email)
    end 
  end 
end
