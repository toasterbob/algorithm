@tested = [[1, 1], [42, 2500], [246, 84100]]

def list_squared(m, n)
  result = []

  (m..n).each do |i|
    test = []
    (1..i).each do |j|
      test << j * j if i % j == 0
    end
    added = test.reduce(:+)
    result << [i, added] if square?(added)
  end
  result
end

def square?(number)
  square = Math.sqrt(number)
  square == square.floor
end
