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

  def is_empty?
    self.items.empty?
  end

end
