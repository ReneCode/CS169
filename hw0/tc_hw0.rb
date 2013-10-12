
require "./hw0"
require "test/unit"

class MyUnitTest < Test::Unit::TestCase
  def test_array()
  	a = [1,2,3,4,5,6,7,8,9]
    assert_equal( 45, sum(a) )
    assert_equal(0, sum([]))
  end

  def test_hw0_2()
  	a = "Rene"
  	s = hello(a)
  	assert_equal("Hello, Rene", s)

  	assert_equal(true, starts_with_consonant?("xabc") )
  	assert_equal(true, starts_with_consonant?("Xabc") )
  	assert_equal(false, starts_with_consonant?("ebc") )
  	assert_equal(false, starts_with_consonant?("") )
  	assert_equal(false, starts_with_consonant?(" .1231") )
  	assert_equal(false, starts_with_consonant?(".aOxabc") )

  	assert_equal(false, binary_multiple_of_4?("1011001") )
  	assert_equal(true, binary_multiple_of_4?("1000"))
  	assert_equal(false, binary_multiple_of_4?("00abc1000"))
  	assert_equal(false, binary_multiple_of_4?(""))
  	assert_equal(false, binary_multiple_of_4?("1100 0022"))

  end

  def test_hw0_3()
  #	b1 = BookInStock.new("", 0)
  #	b2 = BookInStock.new("abc", 0)
	b3 = BookInStock.new("abc", 22)
	assert_equal("abc", b3.isbn)
	assert_equal("$22.00", b3.price_as_string)
	assert_equal("$33.80", BookInStock.new("abc", 33.8).price_as_string)
  end

end


