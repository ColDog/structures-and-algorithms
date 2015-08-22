require 'graphs/graph'

module Graphs
  class DepthFirstSearch
    def initialize(graph, start, target)
      @graph  = Graph.new(graph)
      @start  = @graph.nodes[start]
      @target = @graph.nodes[target]
      @path   = []
    end

    def solve
      stack = [start]
      loop do
        current = stack.pop
        break if current.idx == @target
        stack = stack + @graph.adjacent(current.idx)
        puts "#{stack}"
      end

    end


  end
end
