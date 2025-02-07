require 'minitest/autorun'

class RandomTest < Minitest::Test
  def test_list_is_empty
    list = []
    assert_empty list
    #assert_equal true, list.empty?
  end
end