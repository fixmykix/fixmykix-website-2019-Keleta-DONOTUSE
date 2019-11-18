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

    it 'has an embedded user in the product response' do 
      product_response = JSON.parse(response.body, symbolize_names: true)
      expect(product_response[:user][:email]).to eql(@product.user.email)
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

    it 'should have a user in each product' do 
      product_response = JSON.parse(response.body, symbolize_names: true)
      product_response.each do |product|
        expect(product[:user]).to be_present
      end 
    end 



    it { should respond_with 200 }
  end 


  describe 'CREATE - create new products' do 

    context 'when products are created successfully' do 
      before do 
        @user = FactoryGirl.create(:user)
        @product_attributes = FactoryGirl.attributes_for(:product)
        request.headers['Authorization'] = @user.auth_token
        post :create, params: { user_id: @user.id, product: @product_attributes}
      end 

      it 'product create returns json format of new product' do 

        product_response = JSON.parse(response.body, symbolize_names: true)
        expect(product_response[:title]).to eql(@product_attributes[:title])
      end 

      it { should respond_with 201 }
    end 

    context 'when products are not created successfully' do 
      
      before do 
        @user = FactoryGirl.create(:user)
        @invalide_product_attributes = { title: "Hello world", price: "Iamdope" }
        request.headers['Authorization'] = @user.auth_token
        post :create, params: { user_id: @user.id, product: @invalide_product_attributes }
      end 

      it 'should not create new product' do 
        product_response = JSON.parse(response.body, symbolize_names: true)
        expect(product_response[:errors][:price]).to include "is not a number"
      end 

      it { should respond_with 422 }

    end 


    describe "PUT/PATCH #update" do
      before(:each) do
        @user = FactoryGirl.create :user
        @product = FactoryGirl.create :product, user: @user
        request.headers['Authorization'] = @user.auth_token
      end
  
      context "when is successfully updated" do
        before(:each) do
          patch :update, params: { user_id: @user.id, id: @product.id,
                product: { title: "An expensive TV" } }
        end
  
        it "renders the json representation for the updated user" do
          product_response = JSON.parse(response.body, symbolize_names: true)
          expect(product_response[:title]).to eql "An expensive TV"
        end
  
        it { should respond_with 200 }
      end
  
      context "when is not updated" do
        before(:each) do
          patch :update, params: { user_id: @user.id, id: @product.id,
                product: { price: "two hundred" } }
        end
  
        it "renders an errors json" do
          product_response = JSON.parse(response.body, symbolize_names: true)
          expect(product_response).to have_key(:errors)
        end
  
        it "renders the json errors on whye the user could not be created" do
          product_response = JSON.parse(response.body, symbolize_names: true)
          expect(product_response[:errors][:price]).to include "is not a number"
        end
  
        it { should respond_with 422 }
      end
    end

    describe "DELETE #destroy" do
      before(:each) do
        @user = FactoryGirl.create :user
        @product = FactoryGirl.create :product, user: @user
        request.headers['Authorization'] = @user.auth_token
        delete :destroy, params: { user_id: @user.id, id: @product.id }
      end
  
      it { should respond_with 204 }
    end
  end
end
