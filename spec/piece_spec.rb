require './spec/spec_helper.rb'

describe "Piece" do

  before do
    @knight = Piece.new(type: :knight)
    @queen = Piece.new(type: :queen)
    @board = Board.new(xrange: 0..7, yrange: 0..7)
    @node1 = Node.new(data: [0, 0])
    @node2 = Node.new(data: [6, 6])
  end

  context "knight" do

    it "creates a new chess piece of type :knight" do
      expect(@knight.type).to eq(:knight)
    end

    it "defines the moves a knigh can make" do
      expect(@knight.moves.count).to  eq(8)
      expect(@knight.moves.first).to  eq([1, 2])
      expect(@knight.moves.last).to  eq([-1, 2])
    end

    it "returns the moves that are valid for a board and node" do
      expect(@knight.valid_moves?(board: @board, node: @node1)).to eq([[1, 2], [2, 1]])
      expect(@knight.valid_moves?(board: @board, node: @node2)).to eq([[7, 4], [5, 4], [4, 5], [4, 7]])
    end

    it "traverses from start to finish then returns the path" do
      path1 = @knight.traverses(board: @board, start: [0, 0], finish: [1, 2])
      path2 = @knight.traverses(board: @board, start: [4, 7], finish: [0, 4])
      expect(path1).to eq([[0, 0], [1, 2]])
      expect(path2).to eq([[4, 7], [3, 5], [2, 3], [0, 4]])
    end

  end

  context "queen" do

    it "creates a new chess piece of type :queen" do
      expect(@queen.type).to eq(:queen)
    end

    it "defines the moves a queen can make" do
      expect(@queen.moves.count).to  eq(289)
      expect(@queen.moves.first).to  eq([-8, -8])
      expect(@queen.moves.last).to  eq([8, 8])
    end

  end

end
