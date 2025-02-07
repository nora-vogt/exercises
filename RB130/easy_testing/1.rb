require 'minitest/autorun'

class RandomTest < Minitest::Test
  def test_is_odd
    value = 2
    #assert value.odd?, 'value is not odd'
    assert_equal true, value.odd?, 'value is not odd'
  end
end