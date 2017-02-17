require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    self.store = StaticArray.new(8)
    self.capacity = 8
    self.length = 0
    self.start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    store[(index + start_idx) % capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    store[(index + start_idx) % capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" unless length > 0
    val = self[length - 1]
    self[length - 1] = nil
    self.length -= 1
    val
  end

  # O(1) ammortized
  def push(val)
    resize! if length == capacity
    self.length += 1
    self[length - 1] = val
    nil
  end

  # O(1)
  def shift
    raise "index out of bounds" unless length > 0
    val = self[0]
    self[0] = nil
    self.start_idx = (self.start_idx + 1) % capacity
    self.length -= 1
    val
  end

  # O(1) ammortized
  def unshift(val)
    resize! if length == capacity
    self.length += 1
    self.start_idx = (self.start_idx - 1) % capacity
    self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless index >= 0 && index < self.length
  end

  def resize!
    temp = StaticArray.new(capacity * 2)
    self.capacity.times { |i| temp[i] = self[i]}
    self.capacity *= 2
    self.store = temp
    self.start_idx = 0 
  end
end
