class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot_i = rand(array.length)
    pivot = array[pivot_i]
    left, right = [], []
    array.each_with_index do |el, i|
      next if i == pivot_i
      if el <= pivot
        left << el
      else
        right << el
      end
    end
    sort1(left) + [pivot] + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
    return array if length <= 1

    # start = rand(length)
    barrier = self.partition(array, start, length, &prc)

    left_length = barrier - start
    right_length = length - 1 - barrier
    sort2!(array, start,  left_length, &prc ) #left
    sort2!(array, barrier + 1, right_length, &prc ) #right
    array
  end

  def self.partition(array, start, length, &prc)
    prc = prc || Proc.new { |el1, el2| el1 <=> el2 }

    pivot = array[start]
    barrier = start
    (start + 1).upto(start + length - 1) do |i|
      if prc.call(array[i], pivot) == -1
        if barrier + 1 < i
          array[i], array[barrier + 1] = array[barrier + 1], array[i]
        end
        barrier += 1
      end
    end
    array[start], array[barrier] = array[barrier], array[start]

    barrier
  end

  def self.inplace_sort(array, start = 0, length = array.length, &prc)
    prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
    return array if length <= 1
    pivot = array[start]
    barrier = start
    barrier.upto(array.length - 1) do |i|
      if prc.call(array[i], pivot) == -1
        if barrier + 1 < i
          array[i], array[barrier + 1] = array[barrier + 1], array[i]
        end
        barrier += 1
      end
    end
    array[start], array[barrier] = array[barrier], array[start]

    left_length = barrier - 1
    right_length = length - 1 - barrier
    sort2!(array, start,  left_length, &prc ) #left
    sort2!(array, barrier + 1, right_length, &prc ) #right
    array
  end

end
