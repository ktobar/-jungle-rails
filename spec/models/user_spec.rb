require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here
    it "validates_presence_of :email, :first_name, :last_name, :password, :password_confirmation" do 
      @user = User.new(email: 'test@email.com', first_name: 'Billy', last_name: 'Bod', password: '123456',  password_confirmation: '123456')

      expect(@user.email).not_to eq(nil)
      expect(@user.first_name).not_to eq(nil)
      expect(@user.last_name).not_to eq(nil)
      expect(@user.password).not_to eq(nil)
      expect(@user.password_confirmation).not_to eq(nil)

      
    end
    
    it 'validates_presence_of :email' do 
      @user = User.create(first_name: 'Billy', last_name: 'Bod', password: '123456',  password_confirmation: '123456')

      expect(@user.errors.full_messages).to include("Email can't be blank")
    end 
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here

    it 'should create successfully' do 
      @user = User.new(email: 'test@email.com', first_name: 'Billy', last_name: 'Bod', password: '123456',  password_confirmation: '123456')

      expect(@user).to be_valid

    end 

  end

end