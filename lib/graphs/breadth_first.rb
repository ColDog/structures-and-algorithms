require 'graphs/graph'

module Graphs
  class BreadthFirstSearch
    def initialize(graph)
      @graph = Graph.new(graph)
    end

    def routes(start, finish)
      queue   = [start]
      count   = 0

      loop do
        curr = queue.pop
        break if curr == nil
        count += 1 if curr == finish
        queue = @graph.adjacent( curr ) + queue
      end
      count
    end

    def route?(start, finish)
      queue   = [start]

      loop do
        curr = queue.pop
        return false if curr == nil
        return true  if curr == finish
        queue = @graph.adjacent( curr ) + queue
      end
      count
    end

    def shortest(start, finish)
      queue   = [start]
      count   = 0
      visited = []
      paths   = []

      loop do
        curr = queue.pop
        visited << curr
        break if curr == nil
        if curr == finish
          paths << visited
          visited = []
        end
        queue = @graph.adjacent( curr ) + queue
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

  end
end
