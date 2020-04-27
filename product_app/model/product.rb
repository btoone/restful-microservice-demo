class Product
  attr_accessor :customer_id, :product_name, :domain, :start_date, :duration_months

  def initialize(attrs)
    @customer_id = attrs['customer_id']
    @product_name = attrs['product_name']
    @domain = attrs['domain']
    @start_date = attrs['start_date']
    @duration_months = attrs['duration_months']
  end

  def valid?
    !@product_name.empty?
  end
end

class Domain < Product
  def valid?
    super
    @domain.match? /\.[com|org]/
  end
end
