require 'sinatra'
require 'active_support/all'

require_relative '../service/product_service'

before do
  content_type :json
end

get '/list' do
  ProductService.list.to_json
end

post '/add' do
  params = JSON.parse request.body.read

  if ProductService.add(params)
    # [201, {}, "Product created".to_json]
    status 201
    body "Product created".to_json
  else
    status 422
    body params.to_json
  end
end
