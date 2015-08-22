require 'graphs/graph'

module Graphs
  class DepthFirstSearch
    def initialize(graph)
      @graph = Structures::Graph.new(graph)
    end

    def routes(start, finish)
      stack = [start]
      count = 0
      loop do
        curr = stack.pop
        break      if curr == nil
        count += 1 if curr == finish
        stack = stack + @graph.adjacent(curr)
      end
      count
    end

    def shortest(start, finish)
      stack = [start]
      visited = []
      paths = []
      loop do
        curr = stack.pop
        visited << curr
        break if curr == nil
        if curr == finish
          paths << visited
          visited = []
        end
        stack = stack + @graph.adjacent(curr)
      end

      costs = []
      paths.each do |path|
        struct = Path.new(0, path)
        i = 0
        while i < path.length - 1
          struct.cost += @graph.cost(i,i + 1)
          i += 1
        end
        costs << struct
      end
      costs

    end

    def route?(start, finish)
      stack = [start]
      loop do
        curr = stack.pop
        return false  if curr == nil
        return true   if curr == finish
        stack = stack + @graph.adjacent(curr)
      end
      count
    end

  end
end
