require 'minitest/autorun'

class RandomTest < Minitest::Test
  def test_list_includes_xyz
    list = ['xyz', 'abc', 'hij']
    #list = ['abc', 'def']
    assert_includes list, 'xyz'
    #assert_equal true, list.include?('xyz')
  end
end