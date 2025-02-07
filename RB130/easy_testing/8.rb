require 'minitest/autorun'

class RandomTest < Minitest::Test
  def test_value_is_kind_of_numeric
    #value = 1
    #value = 2.0
    value = Numeric.new
    #value = 'hi'
    assert_kind_of Numeric, value
  end
end