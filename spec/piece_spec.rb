require './spec/spec_helper.rb'

describe "Piece" do

  before do
    @knight = Piece.new(type: :knight)
  end

  it "creates a new chess piece of type :knight" do
    expect(@knight.type).to eq(:knight)
  end

  it "defines the moves a piece can make" do
    expect(@knight.moves.count).to  eq(8)
    expect(@knight.moves.first).to  eq([1, 2])
    expect(@knight.moves.last).to  eq([-1, 2])
  end

end
