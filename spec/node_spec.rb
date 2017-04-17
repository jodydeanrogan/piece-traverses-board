require './spec/spec_helper.rb'

describe "Node" do

  before do
    @node1 = Node.new(data: [0, 0])
  end

  it "creates a new node with data and parent" do
    expect(@node1).to be_truthy
    expect(@node1.data).to eq([0, 0])
    expect(@node1.parent).to eq(nil)
  end

  it "stores the children of the node" do
    @node1.children << [1, 2]
    @node1.children << [2, 1]
    expect(@node1.children).to eq([[1, 2], [2, 1]])
  end

  it "returns the path from upper most parent node to current node" do
    @node2 = Node.new(data: [4, 2], parent: @node1)
    @node3 = Node.new(data: [5, 4], parent: @node2)
    @node1.children << @node2
    @node2.children << @node3
    expect(@node3.return_path).to eq([[0, 0], [4, 2], [5, 4]])
  end

end
