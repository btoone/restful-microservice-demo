require 'faraday'
require 'json'

class AWTracker
  class ServiceError < StandardError; end

  def list
    get_products
  end

  def add(attrs)
    data = attrs.to_json
    create_product(data)
  end

  def load(products)
    products.each do |attrs|
      add(attrs)
    end
  end

  private

  def conn
    Faraday.new(
      url: 'http://127.0.0.1:5001',
      headers: { "Content-Type" => "application/json" }
    )
  end

  def get_products
    resp = conn.get 'list'
    if resp.success?
      puts JSON.parse resp.body
    else
      raise_error
    end
  end

  def create_product(data)
    resp = conn.post 'add', data
    if resp.success?
      puts JSON.parse resp.body
    else
      raise_error
    end
  end

  def raise_error
    raise ServiceError, "Error with service"
  end
end
