# Main runner class
# Usage:
#
#     ruby main.rb
#
require_relative 'aw_tracker'

products = [
  {customer_id: 'Cust123', product_name: 'domain', domain: 'xyzzy.com', start_date: '2020-1-1', duration_months: 12},
  {customer_id: 'Cust123', product_name: 'hosting', domain: 'xyzzy.com', start_date: '2020-1-1', duration_months: 6},
  {customer_id: 'Cust234', product_name: 'domain', domain: 'plugh.org', start_date: '2020-2-1', duration_months: 24}
]

begin
  tracker = AWTracker.new
  puts "\n-- Load products"
  tracker.load(products)

  puts "\n-- Create new product"
  tracker.add({customer_id: 'Cust234', product_name: 'hosting', domain: 'plugh.org', duration_months: 6})

  puts "\n-- List all products"
  tracker.list
rescue AWTracker::ServiceError => error
  puts "#{error.class}: #{error.message}"
end
