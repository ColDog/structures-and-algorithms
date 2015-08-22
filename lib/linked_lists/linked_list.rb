module LinkedLists
  class Single
    include Enumerable
    attr_accessor :first, :last
    def initialize
      @list   = []
      @first  = nil
      @last   = nil
    end

    def <<(data)
      node  =  Node.new(data)
      @last =  node
      @list << node
    end

    def insert(data)
      node   = Node.new(data, @first)
      @first = node
      @list << node
    end

    def add(data, nex)
      node = Node.new(data, nex)
      pointing_at(nex).each { |pointing| pointing.nex = node }
    end

    def pointing_at(target)
      @list.select { |node| node.nex == target }
    end

  end
end
