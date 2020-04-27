require 'faraday'
require 'json'
require_relative '../model/product'

# Global database
$gdb = []

class ProductService
  def self.add(params)
    add_product(params)
  end

  def self.list
    products = $gdb
  end

  def self.add_product(attrs)
    product = Product.new(attrs)

    if product.valid?
      $gdb << product
      register_product
      bill_customer
      true
    else
      false
    end
  end
  private_class_method :add_product

  def self.bill_customer
    resp = bconn.get 'new'
    if resp.success?
      puts JSON.parse resp.body
    else
      puts "debug: error with billing service"
    end
  end

  def self.register_product
    resp = rconn.get 'new'
    if resp.success?
      puts JSON.parse resp.body
    else
      puts "debug: error with register service"
    end
  end

  def self.bconn
    Faraday.new(
      url: 'http://127.0.0.1:5002',
      headers: { "Content-Type" => "application/json" }
    )
  end

  def self.rconn
    Faraday.new(
      url: 'http://127.0.0.1:5003',
      headers: { "Content-Type" => "application/json" }
    )
  end
end
