# require 'test_simple'

class AdjacencyMatrix
  attr_accessor :stack, :adj, :loc, :start, :target

  def initialize(matrix = [[]])
    @adj    = matrix
    @verts  = {}
  end

  def add_vertice(loc = @adj.length, name = nil)
    @verts[name] = loc if name
    @adj.insert(loc, [])
    i = 0
    while i < @adj.length
      @adj[i].insert(loc, [])
    end
    self
  end

  def add_edge(r,c)
    @adj[r][c] = 1
    true
  end

  def remove_edge(r,c)
    @adj[r][c] = 0
    true
  end

  def go_to?(vertice)
    @adj[@loc][vertice]
  end

  def vertices
    (0..@adj.length - 1).to_a
  end

  def find_vertice(name)
    @verts[name]
  end

  def children(loc)
    vertices.select {  |v| @adj[loc][v] == 1 }
  end

  def add_children_to_stack
    @stack = @stack + children
  end

  def depth_first_search(source, target)
    stack = [source]
    loop do
      curr = stack.pop
      return false if curr.nil?
      return true  if curr == target
      puts "#{children(curr)}"

      @stack = stack + children(curr)
    end
  end

  def breadth_first_search(source, target)
    queue = [source]
    loop do
      curr = queue.pop
      return false if curr.nil?
      return true  if curr == target
      puts "#{children(curr)}"

      @stack = children(curr) + queue
    end
  end

end

adj_maxtrix1 = [
  [0, 0, 1, 0, 1, 0],
  [0, 0, 1, 0, 0, 1],
  [0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 1, 1],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0]
]

matrix = AdjacencyMatrix.new(adj_maxtrix1)
puts matrix.depth_first_search(0,5)
puts matrix.breadth_first_search(0,5)
