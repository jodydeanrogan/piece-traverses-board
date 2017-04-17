require './spec/spec_helper.rb'

describe "Board" do

  before do
    @board = Board.new(xrange: 0..7, yrange: 0..7)
  end

  it "creates a new chess board with x and y ranges" do
    expect(@board).to be_truthy
    expect(@board.xrange).to eq(0..7)
    expect(@board.yrange).to eq(0..7)
  end

  it "checks to see if a move is valid" do
    expect(@board.valid?(x: 2, y: 7)).to eq(true)
    expect(@board.valid?(x: 9, y: 3)).to eq(false)
    expect(@board.valid?(x: 5, y: -4)).to eq(false)
  end

end
