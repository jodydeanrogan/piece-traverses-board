require './spec/spec_helper.rb'

describe "Board" do

  before do
    @board = Board.new
  end

  it "creates a new chess board" do
    expect(@board).to be_truthy
  end

end
