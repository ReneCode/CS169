
def sum(arr)
  sum = 0
  arr.each do | item | 
    sum = sum + item 
  end
  sum
end




def max_2_sum(arr)
  sum = 0
  sorted_array = arr.sort.reverse
  if sorted_array.length >= 2
  	sum = sorted_array[0] + sorted_array[1]
  elsif sorted_array.length == 1
  	sum = sorted_array[0]
  end
  sum
end


def hello(a)
  "Hello, " + a
end


def starts_with_consonant?(s)
  if s.length == 0
  	return false
  end 
  c = s[0..0]
  if (c =~ /\w/) == nil
  	return false
  end
  return (c =~ /^[AEIOU].*/i ) == nil
end


def binary_multiple_of_4?(str)
  return (str =~ /^[01]*1[01]*00$/) != nil
end


def b2inary_multiple_of_4?(str)
  if str.length == 0
  	return false
  end
  n0 = str.count "0"
  n1 = str.count "1"
  if n0 + n1 != str.length
  	return false;
  end
  val = str.to_i(2)
  return val  % 4 == 0
end



class BookInStock
  attr_accessor :isbn, :price
  def initialize(isbn, price)
  	raise ArgumentError, 'isbn is empty' if isbn.length == 0
  	raise ArgumentError, 'price too low' if price <= 0
  	@isbn = isbn
  	@price = Float(price)
  end

  def price_as_string
  	return sprintf("$%.2f", price)
  end
end



