
require "./oracle_of_bacon"
require "test/unit"

class MyUnitTest < Test::Unit::TestCase

  def test_hw15_1()
  
    my_api_key = '38b99ce9c87'
#    oob = OracleObBacon.new(my_api_key)
    
    x = OracleOfBacon::Response.new(File.read '../spec/graph_example.xml')
 #   print (x.type)
    print (x.data)
    
=begin    
  #	b1 = BookInStock.new("", 0)
  #	b2 = BookInStock.new("abc", 0)
	b3 = BookInStock.new("abc", 22)
	assert_equal("abc", b3.isbn)
	assert_equal("$22.00", b3.price_as_string)
	assert_equal("$33.80", BookInStock.new("abc", 33.8).price_as_string)
=end
  end

end


