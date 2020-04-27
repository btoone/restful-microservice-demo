require 'minitest/autorun'
require 'pry'

require_relative '../model/product.rb'

# Run specs with command or rake task
#
#     ruby spec/name_of_spec.rb --verbose
#
#     rake spec
#
describe Product do
  before do
    attrs = {'customer_id'=>'', 'product_name'=>''}
    @product = Product.new(attrs)
  end

  describe "when it has a product_name" do
    it 'should be valid' do
      @product.product_name = 'domain'
      _(@product.valid?).must_equal true
    end
  end

  describe "when it does not have a product_name" do
    it 'should be invalid' do
      _(@product.valid?).must_equal false
    end
  end
end

describe Domain do
  before do
    attrs = {'product_name'=>'domain'}
    @domain = Domain.new(attrs)
  end

  describe "when domain is .com or .org" do
    it 'should be valid' do
      @domain.domain = 'example.com'
      _(@domain.valid?).must_equal true
      @domain.domain = 'example.org'
      _(@domain.valid?).must_equal true
    end
  end

  describe "when domain is .net" do
    it 'should not be valid' do
      @domain.domain = 'example.net'
      _(@domain.valid?).must_equal false
    end
  end
end
