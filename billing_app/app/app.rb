require 'sinatra'
require 'active_support/all'

require_relative '../service/billing_service'

before do
  content_type :json
end

get '/new' do
  resp = BillingService.add({})
  [201, {}, resp.to_json]
end
