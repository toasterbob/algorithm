def numbers_with_digit_inside(x, d)
  results = []
  1.upto(x).each do |num|
    num_string = num.to_s
    num_arr = num_string.chars.map { |ch| ch.to_i }
    results << num if num_arr.include?(d)
  end
  multiply = results.empty? ? 0 :  results.inject(&:*)
  [results.count, results.inject(0, &:+), multiply]
end 


# def numbers_with_digit_inside(x, d)
#   nums = ('1'..x.to_s).select { |num| num.include?(d.to_s) }.map(&:to_i)
#   [nums.size, nums.reduce(0, :+), nums.reduce(:*) || 0]
# end
