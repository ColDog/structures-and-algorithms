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


graph = [
  [0,1,0,0,2],
  [0,0,1,0,0],
  [0,0,0,1,0],
  [0,0,0,0,1],
  [0,0,0,0,0]
]

puts Dijkstra.new(graph, 0, 4).solve.path
