class Board

  attr_reader :xrange, :yrange

  def initialize(xrange: nil, yrange: nil)
    @xrange = xrange
    @yrange = yrange
  end

  def valid?(x: nil, y: nil)
    (self.xrange).member?(x) && (self.yrange).member?(y)
  end

end
