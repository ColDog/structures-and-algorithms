require 'test_helper'

class LinkedListsTest < Minitest::Test
  def test_append_list
    list = LinkedLists::Single.new
    list << 1
    list << 2
    assert_equal 2, list.size
    assert_equal 1, list.first.data
    assert_equal 2, list.last.data
  end

  def test_insert_list
    list = LinkedLists::Single.new
    list.insert 1
    list.insert 2
    assert_equal 2, list.size
    assert_equal 2, list.first.data
    assert_equal 1, list.last.data
  end
end
