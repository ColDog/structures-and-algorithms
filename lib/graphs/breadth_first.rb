require 'graphs/graph'

module Graphs
  module BreadthFirst

    def breadth_first_traversal(start)
      queue   = [self.nodes[start]]
      visited = []
      loop do
        current = queue.pop
        visited << current if current
        break if current.nil?
        queue = (self.adjacent(current.idx) - visited) + queue
      end
      visited.map { |n| n.idx }
    end

    def all_paths(start, target)
      paths   = []
      visited = []
      queue   = [self.nodes[start]]
      path    = []

      loop do
        current = queue.pop
        visited << current if current
        if current.nil?
          visited, path = []
          queue = [self.nodes[start]]
        elsif paths.match current path
          visited, path = []
          queue = [self.nodes[start]]
        else
          queue = (self.adjacent(current.idx) - visited) + queue
        end
      end
    end

  end
end
