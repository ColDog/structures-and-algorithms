require 'test_helper'

class DijkstraTest < Minitest::Test
  def setup
    @adj_matrix = [
      [0, 0, 1, 0, 1, 0],
      [0, 0, 1, 0, 0, 1],
      [0, 0, 0, 1, 0, 0],
      [0, 0, 0, 0, 1, 1],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0]
    ]
  end

  def test_finds_path
    graph = Graphs::Dijkstra.new(@adj_matrix, 0, 4).solve
    assert_equal graph.path, [2,4]
  end

end
