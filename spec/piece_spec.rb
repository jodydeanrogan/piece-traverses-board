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
      path3 = @knight.traverses(board: @board, start: [3, 3], finish: [6, 3])
      expect(path1).to eq([[0, 0], [1, 2]])
      expect(path2).to eq([[4, 7], [3, 5], [2, 3], [0, 4]])
      expect(path3).to eq([[3, 3], [5, 4], [7, 5], [6, 3]])
    end

  end

  context "queen" do

    it "creates a new chess piece of type :queen" do
      expect(@queen.type).to eq(:queen)
    end

    it "defines the moves a queen can make" do
      expect(@queen.moves.count).to  eq(67)
      expect(@queen.moves.first).to  eq([-8, -8])
      expect(@queen.moves.last).to  eq([8, -8])
    end

    it "returns the moves that are valid for a board and node" do
      expect(@queen.valid_moves?(board: @board, node: @node1).count).to eq(24)
      expect(@queen.valid_moves?(board: @board, node: @node2).count).to eq(26)
    end

    it "traverses from start to finish then returns the path" do
      path1 = @queen.traverses(board: @board, start: [0, 0], finish: [0, 7])
      path2 = @queen.traverses(board: @board, start: [0, 0], finish: [1, 7])
      path3 = @queen.traverses(board: @board, start: [3, 3], finish: [2, 5])
      expect(path1).to eq([[0, 0], [0, 7]])
      expect(path2).to eq([[0, 0], [1, 1], [1, 7]])
      expect(path3).to eq([[3, 3], [0, 3], [2, 5]])
    end

  end

end
