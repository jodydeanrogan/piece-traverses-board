require './spec/spec_helper.rb'

describe "Queue" do

  before do
    @queue = Queue.new
  end

  it "creates a new queue" do
    expect(@queue).to be_truthy
  end

  it "adds an object to the queue" do
    @queue.enqueue("object")
    expect(@queue.items.count).to eq(1)
  end

  it "gets the first item in the queue" do
    @queue.enqueue("first_object")
    @queue.enqueue("second_object")
    @queue.enqueue("third_object")
    @item = @queue.dequeue
    expect(@item).to eq("first_object")
  end

  it "returns true if the queue is empty" do
    expect(@queue.is_empty?).to eq(true)
    @queue.enqueue("object")
    expect(@queue.is_empty?).to eq(false)
  end

end
