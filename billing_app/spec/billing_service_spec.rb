require 'minitest/autorun'
require 'pry'

require_relative '../service/billing_service.rb'

# Run specs with command or rake task
#
#     ruby spec/name_of_spec.rb --verbose
#
#     rake spec
#
describe BillingService do
  before do
  end

  describe 'when a domain is registered' do
    it 'should bill the customer'
  end
end
