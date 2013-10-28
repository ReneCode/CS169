
require "./oracle_of_bacon"
require "test/unit"

class MyUnitTest < Test::Unit::TestCase

  def test_hw15_1()
  
    my_api_key = '38b99ce9ec87'
    oob = OracleOfBacon.new(my_api_key)
    oob.to = 'Laurence Olivier'
    oob.find_connections
#    puts oob.response.data

  	assert_equal(:graph, oob.response.type )
    assert_equal(:graph, oob.response.type )
    assert( oob.response.data.include?('A Bridge Too Far (1977)'), "wrong data" + oob.response.data.inspect )
  end



  def test_hw15_2()
    my_api_key = 'xyz'
    oob = OracleOfBacon.new(my_api_key)
    oob.to = 'Laurence Olivier'
    oob.find_connections
  	assert_equal(:error, oob.response.type )
   end

end

