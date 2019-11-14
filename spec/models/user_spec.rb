require 'rails_helper'

RSpec.describe User, type: :model do

  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('example@domain.com').for(:email) }

  it { should respond_to(:auth_token) }
  it { should validate_uniqueness_of(:auth_token) }

  describe 'generate unique authentication token' do
    it 'generates token' do 
      allow(Devise).to receive(:friendly_token).and_return("auniquetoken")
      @user.generate_authentication_token!
      expect(@user.auth_token).to eql("auniquetoken")
    end 

    it 'should reject a duplicated auth token' do 
      existing_user = FactoryGirl.create(:user, auth_token: 'auniquetoken123')
      @user.generate_authentication_token!
      expect(@user.auth_token).not_to eql(existing_user.auth_token)
    end 
  end 
end