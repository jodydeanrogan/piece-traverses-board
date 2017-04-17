class Node

  attr_reader :data, :parent
  attr_accessor :children

  def initialize(data: nil, parent: nil)
    @data = data
    @parent = parent
    @children = []
  end

  def return_path
    path = []
    node = self
    until node == nil
      path << node.data
      node = node.parent
    end
    path.reverse
  end

end
