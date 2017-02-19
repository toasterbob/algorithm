require 'set'

def list_squared(m, n)
  result = []

  (m..n).each do |i|
    test = Set.new((1..Math.sqrt(i)).select { |num| i % num == 0 })
    test += test.map { |num| i/num }
    added = test.map { |num| num * num }.to_a.reduce(:+)
    if square?(added)
      result << [i, added]
    end
  end
  result
end

def square?(number)
  square = Math.sqrt(number)
  square == square.floor
end




# @tested = [[1, 1], [42, 2500], [246, 84100], [287, 84100], [728, 722500], [1434, 2856100], [1673, 2856100],
#           [1880, 4884100], [4264, 24304900], [6237, 45024100], [9799, 96079204], [9855, 113635600]]
#
# def list_squared(m, n)
# #   p m
# #   p n
#   result = []
#
#   @tested.each do |arr|
#     result << arr if arr[0] >= m && arr[0] <= n
#   end
#   continue = result.last
#   left_off = continue ? continue[0] : nil
#   if left_off.nil?
#     list_squared2(m, n)
#   elsif left_off > m && left_off < n
#     result + list_squared2(left_off + 1, n)
#   else
#     result
#   end
# end
#
# def list_squared2(m, n)
#   result = []
#
#   (m..n).each do |i|
#     test = []
#     (1..i).each do |j|
#       test << j * j if i % j == 0
#     end
#     added = test.reduce(:+)
#     if square?(added)
#       result << [i, added]
#       @tested << [i, added]
#     end
#   end
#   result
# end
#
# def square?(number)
#   square = Math.sqrt(number)
#   square == square.floor
# end
#

# need to optimize solution
