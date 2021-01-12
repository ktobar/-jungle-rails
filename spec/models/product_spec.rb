require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "validates :name, :price, :quantity, :category, presence: true" do 
      @category = Category.new(name: 'Books')
      @product = Product.new(name: 'Bible', price: 777, quantity: 3, category: @category)

    expect(@product.name).not_to eq(nil)
    expect(@product.price).not_to eq(nil)
    expect(@product.quantity).not_to eq(nil)
    expect(@product.category).not_to eq(nil)
    end

    it 'validates :name, presence: true' do
      @category = Category.new(name: 'Books')
      @product = Product.create(price: 777, quantity: 3, category: @category )
      
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'validates :price, presence: true' do
      @category = Category.new(name: 'Books')
      @product = Product.create(name: 'Bible', quantity: 3, category: @category)
      
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it 'validates :quantity, presence: true' do
      @category = Category.new(name: 'Books')
      @product = Product.create(name: 'Bible', price: 777, category: @category)
      
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'validates :category, presence: true' do
      @category = Category.new(name: 'Books')
      @product = Product.create(name: 'Bible', price: 777, quantity: 3)
      
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
