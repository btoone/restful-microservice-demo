require 'minitest/autorun'

require_relative '../aw_tracker.rb'

# Run specs with command or rake task
#
#     ruby spec/name_of_spec.rb --verbose
#
#     rake spec
#
describe AWTracker do
  before do
    @awt = AWTracker.new
  end

  it 'outputs a list of products' do
    proc { @awt.list }.must_output /Cust123/
  end

  it 'adds a product'
  it 'loads a collection of products'
end
