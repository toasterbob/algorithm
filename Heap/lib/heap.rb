class BinaryMinHeap
  def initialize(&prc)
    self.store = []
    self.prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
  end

  def count
    store.length
  end

  def extract
    val = store[0]
    if count > 1
      store[0] = store.pop
      self.class.heapify_down(store, 0, &prc)
    else
      store.pop
    end
    val
  end

  def peek
    raise "no element" if count == 0
    store[0]
  end

  def push(val)
    store.push(val)
    self.class.heapify_up(store, store.length - 1, &prc)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(length, parent_index)
    [2 * parent_index + 1, 2 * parent_index + 2].select { |el| el < length }
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |el, el2| el <=> el2 }

    left, right = child_indices(len, parent_idx)
    parent_value = array[parent_idx]
    children = []
    children << array[left] if left
    children << array[right] if right

    return array if children.all? { |child| prc.call(parent_value, child) <= 0}
    swap_indx = nil
    if children.length == 1
      swap_indx = left
    else
      swap_indx = prc.call(children[0], children[1]) == -1 ? left : right
    end

    array[swap_indx], array[parent_idx] = array[parent_idx], array[swap_indx]
    heapify_down(array, swap_indx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |el, el2| el <=> el2 }

    return array if child_idx == 0

    parent_idx = parent_index(child_idx)

    if prc.call(array[child_idx], array[parent_idx]) >= 0
      return array
    else
      array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
      heapify_up(array, parent_idx, len, &prc)
    end
  end

end


















#
