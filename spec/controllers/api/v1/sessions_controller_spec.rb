require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do

  describe "POST - create user session" do 
    
    before(:each) do 
      @user = FactoryGirl.create(:user)
    end 

    context 'when the credentials are correct' do 

      before(:each) do 
        credentials = { email: @user.email, password: '12345678' }
        post :create, params: { session: credentials }
      end

      it 'should return user logged in' do 
        user_response = JSON.parse(response.body, symbolize_names: true)
        @user.reload
        expect(user_response[:auth_token]).to eql(@user.auth_token)
      end 

      it { should respond_with 200 }

    end 

    context 'when the credentials are incorrect' do 
      before(:each) do 
        credentials = { email: @user.email, password: 'invalidpassword' }
        post :create, params: { session: credentials }
      end

      it 'should return json error' do 
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors]).to eql("Invalid email or password")
      end 
      
      it { should respond_with 422 }
    end 
  end 


  describe 'DELETE - destroy user session' do
    before(:each) do 
      @user = FactoryGirl.create(:user)
      sign_in @user, store: false
      delete :destroy, params: { id: @user.id }
    end 

    it { should respond_with 204}
  end 
end
