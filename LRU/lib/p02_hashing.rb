class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hashed = 0
    # self.each do
    self.each_with_index do |el, i|
      hashed += (el.hash + i.hash).hash
    end
    hashed
  end
end

class String

  def hash
    hashed = 0
    (self.length).times do |i|
      hashed += (self[i].ord + i).hash
    end
    hashed
  end

end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  # When you get to hashing hashes: one trick to make a hash function
  # order-agnostic is to turn the object into an array, stably sort the
  # array, and then hash the array. This'll make it so every unordered
  # version of that same object will hash to the same value.
  def hash
    self.to_a.sort.hash
  end
end
