require './spec/spec_helper.rb'

describe "Node" do

  before do
    @node = Node.new(data: [0, 0])
  end

  it "creates a new node with data and parent" do
    expect(@node).to be_truthy
    expect(@node.data).to eq([0, 0])
    expect(@node.parent).to eq(nil)
  end

  it "stores the children of the node" do
    @node.children << [1, 2]
    @node.children << [2, 1]
    expect(@node.children).to eq([[1, 2], [2, 1]])
  end

end
