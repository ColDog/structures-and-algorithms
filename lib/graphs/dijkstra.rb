require 'graphs/graph'

module Graphs
  class Dijkstra
    attr_accessor :graph, :path
    def initialize(matrix, start, target)
      @graph  = Graph.new(matrix)
      @start  = start
      @target = target
      @path   = []
    end

    def calculate_cost(solved, unsolved_node)
      unsolved_node.cost = @graph.cost(solved.idx, unsolved_node.idx) + solved.cost
    end

    def lowest_cost_node
      lowest_cost_node = nil
      @graph.unsolved_and_connected_to_solved.each do |solved_node, unsolved_nodes|
        unsolved_nodes.each do |unsolved_node|
          calculate_cost(solved_node, unsolved_node)

          if lowest_cost_node.nil? or unsolved_node.cost < lowest_cost_node.cost
            lowest_cost_node = unsolved_node
            lowest_cost_node.from << unsolved_node.idx
          end

        end
      end
      lowest_cost_node
    end

    def solve
      # begin with the node denoted from the graphs table
      # and mark this node as solved
      current = @graph.nodes[@start]
      current.solved = true

      loop do
        puts "current: #{current.idx}, current_cost: #{current.cost}"
        # step 1: identify all unsolved nodes
        # step 2: calculate the cost to get to unsolved nodes from every solved node.
        # step 3: move to the lowest cost node.
        current = lowest_cost_node
        current.solved = true
        @path << current.idx

        return self if current.idx == @target
      end
    end

  end
end
