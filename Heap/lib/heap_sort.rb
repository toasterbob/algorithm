require_relative "heap"

class Array
  def heap_sort!

    1.upto(count - 1).each do |i|
      BinaryMinHeap.heapify_up(self, i, i + 1)
    end

    (count - 1).downto(1).each do |i|
      self[0], self[i] = self[i], self[0]
      BinaryMinHeap.heapify_down(self, 0, i)
    end

    self.reverse!
  end
end
