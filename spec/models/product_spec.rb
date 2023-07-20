require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    it 'creates a product with all four fields set' do
      @category = Category.create(name: 'Test')
      @product = Product.new(name: 'Test', price: 100, quantity: 1, category: @category)
      expect(@product.valid?)
    end
    it 'validates :name, presence: true' do
      @category = Category.create(name: 'Test')
      @product = Product.new(name: nil, price: 100, quantity: 1, category: @category)
      expect (@product.valid?)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'validates :price, presence: true' do
      @category = Category.create(name: 'Test')
      @product = Product.new(name: 'test', price_cents: nil, quantity: 1, category: @category)
      expect (@product.valid?)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'validates :name, presence: true' do
      @category = Category.create(name: 'Test')
      @product = Product.new(name: 'test', price: 100, quantity: nil, category: @category)
      expect (@product.valid?)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'validates :name, presence: true' do
      @category = Category.create(name: 'Test')
      @product = Product.new(name: 'test', price: 100, quantity: 1, category: nil)
      expect (@product.valid?)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    
  end

end
