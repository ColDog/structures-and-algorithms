# require 'test_simple'

# require 'structures/queue'
# require 'structures/stack'

module Structures

  class Queue < Array
    def enqueue(args)
      push(args)
    end
    def dequeue
      shift
    end
  end

  class Stack < Array
  end
end

module Graph
  class Adjacency
    attr_accessor :matrix
    def initialize(matrix = [])
      @matrix = matrix
    end

    def vertices
      (0..@matrix.length - 1).to_a
    end

    def adjacent(loc)
      @matrix[loc].each_index.select{ |i| @matrix[loc][i] > 0 }
    end

  end
end


def dfs
  graph = Graph::Adjacency.new [
    [0, 0, 1, 1, 1, 1],
    [1, 0, 1, 1, 1, 1],
    [1, 0, 1, 1, 1, 1],
    [1, 1, 0, 1, 1, 1],
    [1, 1, 0, 0, 1, 1],
    [1, 1, 1, 1, 0, 1],
    [1, 1, 0, 1, 1, 0]
  ]
  stack   = Structures::Stack.new
  vertex  = 0
  results = []
  visited = []

  stack.push vertex
  visited << vertex
  results << vertex
  loop do
    break if stack.empty?
    candid = graph.adjacent( stack.first ) - visited
    if candid.any?
      nex = candid.first
      stack.push nex
      visited << nex
      results << nex
    else
      stack.pop
    end
    puts "stack: #{stack}, next: #{candid.first}, candid: #{candid}, results: #{results}"
  end

end

# how many possible paths from a to e?
def routes
  graph = Graph::Adjacency.new
  graph.matrix = [
    [0,1,0,0,1],
    [0,0,1,0,0],
    [0,0,0,1,0],
    [0,0,0,0,1],
    [0,0,0,0,0]
  ]
  stack   = Structures::Stack.new
  vertex  = 0
  paths   = 0
  visited = []

  stack.push vertex
  visited << vertex
  loop do
    puts "#{stack}"
    paths += 1 if stack.first == 5
    break if stack.empty?
    candid = graph.adjacent(stack.first) - visited
    if candid.any?
      stack.push candid.first
      visited << candid.first
    else
      stack.pop
    end
  end
  return paths
end

puts 'routes with depth first'
puts routes


def bfs
  graph = Graph::Adjacency.new [
    [0, 0, 1, 1, 1, 1],
    [1, 0, 1, 1, 1, 1],
    [1, 0, 1, 1, 1, 1],
    [1, 1, 0, 1, 1, 1],
    [1, 1, 0, 0, 1, 1],
    [1, 1, 1, 1, 0, 1],
    [1, 1, 0, 1, 1, 0]
  ]
  queue   = []
  curr    = 0
  results = []
  visited = []

  loop do
    puts "curr: #{curr}, queue: #{queue}, next: #{queue.first}, results: #{results}, adjacent: #{graph.adjacent( curr )}"

    add = graph.adjacent( curr ) - visited

    queue.push(*add)
    visited.push(*add)
    curr    = queue.shift
    break if queue.empty?
  end

end
