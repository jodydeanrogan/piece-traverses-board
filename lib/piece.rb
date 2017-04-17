class Piece

  attr_reader :type

  def initialize(type: nil)
    @type = type
  end

  def moves
    Piece.send(self.type)
  end

  def valid_moves?(board: nil, node: nil)
    moves = self.moves.map do |move|
      xmove = node.data[0] + move[0]
      ymove = node.data[1] + move[1]
      [xmove, ymove] if board.valid?(x: xmove, y: ymove)
    end
    return moves.compact
  end

  def self.knight
    [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  end

end
