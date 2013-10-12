
class BookInStock
  attr_accessor :isbn
  attr_accessor :price
#  @isbn   @price

  def initialize(isbn, price)
  	raise ArgumentError, 'isbn is empty' if isbn.length == 0
  	raise ArgumentError, 'price too low' if price <= 0

	# initialize the varables
  	@isbn = isbn
  	@price = Float(price)
  end

  def price_as_string
  	return sprintf("$%.2f", price)
  end
end

