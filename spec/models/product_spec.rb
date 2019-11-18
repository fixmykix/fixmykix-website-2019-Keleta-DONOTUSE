require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:product) { FactoryGirl.build :product }

  subject { product }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:price) }
  it { should respond_to(:published) }
  it { should respond_to(:user_id) }

  it { should_not be_published }

  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  it { should validate_presence_of :user_id }

  it { should belong_to :user }

  it { should have_many(:placements) }
  it { should have_many(:orders).through(:placements) }


  describe ".search" do
    before(:each) do
      @product1 = FactoryGirl.create :product, price: 100, title: "Plasma tv"
      @product2 = FactoryGirl.create :product, price: 50, title: "Videogame console"
      @product3 = FactoryGirl.create :product, price: 150, title: "MP3"
      @product4 = FactoryGirl.create :product, price: 99, title: "Laptop"
    end

    context "when title 'videogame' and '100' a min price are set" do
      it "returns an empty array" do
        search_hash = { keyword: "videogame", min_price: 100 }
        expect(Product.search(search_hash)).to be_empty
      end
    end

    context "when title 'tv', '150' as max price, and '50' as min price are set" do
      it "returns the product1" do
        search_hash = { keyword: "tv", min_price: 50, max_price: 150 }
        expect(Product.search(search_hash)).to match_array([@product1]) 
      end
    end

    context "when an empty hash is sent" do
      it "returns all the products" do
        expect(Product.search({})).to match_array([@product1, @product2, @product3, @product4])
      end
    end

    context "when product_ids is present" do
      it "returns the product from the ids" do
        search_hash = { product_ids: [@product1.id, @product2.id]}
        expect(Product.search(search_hash)).to match_array([@product1, @product2])
      end
    end
  end
end
