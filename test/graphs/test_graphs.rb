require 'test_helper'

class DepthFirstTest < Minitest::Test
  #   a b c d e f
  # a 0 1 1 0 0 0
  # b 0 0 0 0 1 0
  # c 0 0 0 1 0 1
  # d 0 0 0 0 0 1
  # e 0 0 0 0 0 0
  # f 0 0 0 0 0 0

  def setup
    @matrix = [
      [0, 1, 1, 0, 0, 0],
      [0, 0, 0, 0, 1, 0],
      [0, 0, 0, 1, 0, 1],
      [0, 0, 0, 0, 0, 1],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0]
    ]
  end

  def test_basic_depth
    graph = Graphs::Graph.new(@matrix)
    assert_equal [0,1,2,3,4,5], graph.depth_first_traversal(0).sort
  end

  def test_basic_breadth
    graph = Graphs::Graph.new(@matrix)
    assert_equal [0,1,2,3,4,5], graph.breadth_first_traversal(0).sort
  end

  # def test_all_possible
  #   graph = Graphs::Graph.new(@matrix)
  #   graph.all_paths(0,5)
  # end


end
