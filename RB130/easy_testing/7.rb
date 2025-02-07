require 'minitest/autorun'

class RandomTest < Minitest::Test
  def test_value_is_numeric
    #value = 1
    value = Numeric.new
    assert_instance_of Numeric, value
  end
end