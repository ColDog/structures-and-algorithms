module Graphs
  class Node
    attr_accessor :from, :cost, :solved, :name, :idx
    def initialize(name, idx)
      @from   = []
      @cost   = 0
      @solved = false
      @name   = name
      @idx    = idx
    end
    def unsolved?
      !@solved
    end
    def solved?
      @solved
    end
  end

  class Graph
    attr_accessor :matrix, :nodes

    def initialize(matrix = [], names = [])
      @matrix = matrix
      @nodes  = []
      vertices.each_with_index { |v,i| @nodes << Node.new(names[i],i) }
    end

    def adjacent(loc)
      @nodes.values_at(*@matrix[loc].each_index.select{ |i| @matrix[loc][i] > 0 })
    end

    def unsolved_nodes
      @nodes.select { |node| node.unsolved? }
    end

    def solved_nodes
      @nodes.select { |node| node.solved? }
    end

    def unsolved_adjacent(loc)
      adjacent(loc).select { |node| node.unsolved?  }
    end

    def unsolved_and_connected_to_solved
      connections = {}
      solved_nodes.each do |solved_node|
        connections[solved_node] = unsolved_adjacent(solved_node.idx)
      end
      connections
    end

    def vertices
      (0..@matrix.length - 1).to_a
    end

    def cost(loc, edge)
      @matrix[loc][edge]
    end
  end
end
