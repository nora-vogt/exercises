require 'minitest/autorun'

class RandomTest < Minitest::Test
  def test_refute
    list = ['xyz', 'abc']
    #list = ['abc']
    refute_includes list, 'xyz'
  end
end