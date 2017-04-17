class Queue

  attr_reader :items

  def initialize
    @items = []
  end

  def enqueue(obj)
    self.items << obj
  end

  def dequeue
    self.items.shift
  end

end
