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


  describe 'CREATE - create new products' do 

    context 'when products are created successfully' do 
      before do 
        @user = FactoryGirl.create(:user)
        @product_attributes = FactoryGirl.attributes_for(:product)
        request.headers['Authorization'] = @user.auth_token
        post :create, { user_id: @user.id, product: product_attributes}
      end 

      it 'product create returns json format of new product' do 

        product_response = JSON.parse(response.body, symbolize_names: true)
        expect(product_response[:title]).to eql(@product_response[:title])
      end 

      it { should respond_with 201 }
    end 

    context 'when products are not created successfully' do 
      
      before do 

      end 

    end 
  end
end
