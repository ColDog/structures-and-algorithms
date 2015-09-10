require 'test_helper'

class SortingTest < Minitest::Test
  def test_bubble_sort
    assert_equal [0,2,4,1,3].bubble_sort, [0,1,2,3,4]
  end
  def test_insertion_sort
    assert_equal [0,2,4,1,3].insertion_sort, [0,1,2,3,4]
  end
end
