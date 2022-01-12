require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should be valid" do
      @product = Product.new
      @category = Category.new
      @category.name = 'Amazing Category'
      @product.name = 'Incredible Product'
      @product.price_cents = 18956
      @product.quantity = 16
      @product.category = @category
      expect(@product.valid?).to be true
    end

    it "should have a name present" do
      @product = Product.new
      @product.name = nil
      @product.valid?
      expect(@product.errors[:name]).to  include("cannot be empty here")

      @product.name = 'Incredible Product'
      @product.valid? 
      expect(@product.errors[:name]).not_to  include("cannot be empty here")
    end

    it "should have a price_cents present" do
      @product = Product.new
      @product.price_cents = nil
      @product.valid?
      expect(@product.errors[:price_cents]).to  include("This is not a number")

      @product.price_cents = 18956
      @product.valid? 
      expect(@product.errors[:price_cents]).not_to  include("cannot be empty here")
    end

    it "should have quantity present" do
      @product = Product.new
      @product.quantity = nil
      @product.valid?
      expect(@product.errors[:quantity]).to  include("cannot be empty here")

      @product.quantity = 16
      @product.valid? 
      expect(@product.errors[:quantity]).not_to  include("cannot be empty here")
    end

    it "should have a category_id present" do
      @category = Category.new
      @product = Product.new
      @product.category = nil
      @product.valid?
      expect(@product.errors[:category]).to  include("cannot be empty here")

      @product.category = @category
      @product.valid? 
      expect(@product.errors[:category]).not_to  include("cannot be empty here")
    end
  end
end
