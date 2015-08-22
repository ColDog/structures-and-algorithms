require 'linked_lists/node'

module LinkedLists
  class Single
    include Enumerable
    def initialize
      @list   = []
      @first  = nil
      @last   = nil
    end

    def <<(data)
      node      =  Node.new(data, nil, last_idx)
      @list[@last].nex =  node.idx if @last
      @first    =  node.idx if @first.nil?
      @last     =  node.idx
      @list     << node
    end

    def insert(data)
      nex    = @first ? @list[@first].idx : nil
      node   = Node.new(data, nex, last_idx)
      @first = node.idx
      @last  = node.idx if @last.nil?
      @list << node
    end

    def add(data, nex)
      node = Node.new(data, nex)
      pointing_at(nex).each { |pointing| pointing.nex = node }
    end

    def pointing_at(target)
      @list.select { |node| node.nex == target }
    end

    def where(data)
      @list.select { |node| node.data == data }
    end

    def find(data)
      where(data).first
    end

    def length
      @list.length
    end

    def size
      @list.size
    end

    def empty?
      @list.empty?
    end

    def first
      @list[@first]
    end

    def last
      @list[@last]
    end

    private
    def last_idx
      @list.length
    end

  end
end
