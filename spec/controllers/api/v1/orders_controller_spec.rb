require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :controller do

  describe "GET #index" do
    before(:each) do
      current_user = FactoryGirl.create :user
      request.headers['Authorization'] = current_user.auth_token
      4.times { FactoryGirl.create :order, user: current_user }
      get :index, params: { user_id: current_user.id } 
    end

    it "returns 4 order records from the user" do
      orders_response = JSON.parse(response.body, symbolize_names: true)
      expect(orders_response.size).to eql(4)
    end

    it { should respond_with 200 }
  end

  describe "GET #show" do
    before(:each) do
      current_user = FactoryGirl.create :user
      request.headers['Authorization'] = current_user.auth_token
      @order = FactoryGirl.create :order, user: current_user
      get :show, params: { user_id: current_user.id, id: @order.id }
    end
  
    it "returns the user order record matching the id" do
      order_response = JSON.parse(response.body, symbolize_names: true)
      expect(order_response[:id]).to eql @order.id
    end
  
    it { should respond_with 200 }
  end 
end
