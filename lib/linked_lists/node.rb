module LinkedLists
  class Node
    attr_accessor :nex, :data, :idx
    def initialize(data, nex = nil, idx = nil)
      @data = data
      @nex  = nex
      @idx  = idx
    end
  end
end
