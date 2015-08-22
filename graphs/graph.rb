require 'ostruct'

module Structures
  class Graph
    attr_accessor :matrix
    def initialize(matrix = [])
      @matrix = matrix
    end
    def adjacent(loc)
      @matrix[loc].each_index.select{ |i| @matrix[loc][i] > 0 }
    end
    def vertices
      (0..@matrix.length - 1).to_a
    end
    def cost(loc, edge)
      @matrix[loc][edge]
    end
  end
end

module Algorithms
  Path = Struct.new(:cost, :path)

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

  class BreadthFirstSearch
    def initialize(graph)
      @graph = Structures::Graph.new(graph)
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

costs = Algorithms::DepthFirstSearch.new([
  [0,1,0,0,1],
  [0,0,1,0,0],
  [0,0,0,1,0],
  [0,0,0,0,1],
  [0,0,0,0,0]
]).shortest(0,4)

print costs
