require 'graphs/graph'

module Graphs
  module DepthFirst

    def depth_first_traversal(start)
      stack   = [self.nodes[start]]
      visited = []
      loop do
        current = stack.pop
        visited << current if current
        break if current.nil?
        stack = stack + (self.adjacent(current.idx) - visited)
      end
      visited.map { |n| n.idx }
    end

  end
end
