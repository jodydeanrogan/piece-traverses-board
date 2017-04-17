class Piece

  attr_reader :type

  def initialize(type: nil)
    @type = type
  end

  def moves
    Piece.send(self.type)
  end

  def self.knight
    [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
  end

end
