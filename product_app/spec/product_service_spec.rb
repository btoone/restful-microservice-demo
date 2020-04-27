require 'minitest/autorun'
require 'pry'

require_relative '../service/product_service.rb'

# Run specs with command or rake task
#
#     ruby spec/name_of_spec.rb --verbose
#
#     rake spec
#
describe ProductService do
  before do
  end

  it 'should list products' do
    _(ProductService.list).must_be_kind_of Array
  end

  it 'should add a product' do
    products = ProductService.list
    _(products).must_be_empty
    ProductService.add({'product_name'=>'domain'})
    _(products).wont_be_empty
  end
end
