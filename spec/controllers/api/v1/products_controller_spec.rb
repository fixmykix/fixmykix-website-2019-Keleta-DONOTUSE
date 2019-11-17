require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do

  describe 'show - products' do 
    
    before do 
      @product = FactoryGirl.create(:product)
      get :show, params: { id: @product.id }
    end 

    it 'products are successfully rendered' do 
      product_response = JSON.parse(response.body, symbolize_names: true)
      expect(product_response[:title]).to eql(@product.title)
    end 

    it { should respond_with 200 }
    
  end

  describe 'GET - products index' do 

    before do 
      4.times { FactoryGirl.create :product }
      get :index
    end

    it 'it should show all products' do 
      product_response = JSON.parse(response.body, symbolize_names: true)
      expect(product_response.size).to eql(4)
    end 

    it { should respond_with 200 }
  end 
end
