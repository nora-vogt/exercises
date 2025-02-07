require 'minitest/autorun'

class RandomTest < Minitest::Test
  def test_value_is_downcase
    value = 'XYZ'
    assert_equal 'xyz', value.downcase
  end
end