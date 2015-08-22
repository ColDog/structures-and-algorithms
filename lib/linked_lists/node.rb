module LinkedList
  class Node
    def initialize(data, nextv = nil, previ = nil)
      @data = data
      @next = nextv
      @prev = previ
    end
  end
end
