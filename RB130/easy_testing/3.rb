require 'minitest/autorun'

class RandomTest < Minitest::Test
  def test_value_is_nil
    value = nil
    #value = 'hi'
    assert_nil value
  end
end