class Node

  attr_accessor :data, :parent, :children

  def initialize(data: nil, parent: nil)
    @data = data
    @parent = parent
    @children = []
  end

end
