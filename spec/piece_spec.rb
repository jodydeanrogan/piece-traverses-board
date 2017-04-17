require './spec/spec_helper.rb'

describe "Piece" do

  before do
    @knight = Piece.new(type: :knight)
    @board = Board.new(xrange: 0..7, yrange: 0..7)
    @node1 = Node.new(data: [0, 0])
    @node2 = Node.new(data: [6, 6])
  end

  it "creates a new chess piece of type :knight" do
    expect(@knight.type).to eq(:knight)
  end

  it "defines the moves a piece can make" do
    expect(@knight.moves.count).to  eq(8)
    expect(@knight.moves.first).to  eq([1, 2])
    expect(@knight.moves.last).to  eq([-1, 2])
  end

  it "returns the moves that are valid for a board and node" do
    expect(@knight.valid_moves?(board: @board, node: @node1)).to eq([[1, 2], [2, 1]])
    expect(@knight.valid_moves?(board: @board, node: @node2)).to eq([[7, 4], [5, 4], [4, 5], [4, 7]])
  end

end
