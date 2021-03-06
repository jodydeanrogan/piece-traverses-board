class Piece

  attr_reader :type

  def initialize(type: nil)
    @type = type
  end

  def moves
    Piece.send(self.type)
  end

  def valid_moves(board: nil, node: nil)
    moves = self.moves.map do |move|
      xmove = node.data[0] + move[0]
      ymove = node.data[1] + move[1]
      [xmove, ymove] if board.valid?(x: xmove, y: ymove)
    end
    moves.compact
  end

  def traverses(board: nil, start: nil, finish: nil)
    queue = Queue.new
    node = Node.new(data: start)
    queue.enqueue(node)
    until node.data == finish
      node = queue.dequeue
      node.children = self.valid_moves(board: board, node: node)
      node.children.each do |child|
        queue.enqueue(Node.new(data: child, parent: node))
      end
    end
    node.return_path
  end

  def self.knight
    [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  end

  def self.queen
    moves = []
    (-8..8).each do |num|
      moves << [num, num]
      moves << [num, 0]
      moves << [0, num]
      unless num == 0
        new_num = num.abs if num < 0
        new_num = -(num) if num > 0
        moves << [num, new_num]
      end
    end
    moves
  end

end
