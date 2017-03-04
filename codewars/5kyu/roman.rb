ROMAN_NUMERALS = {1 => "I", 4 => "IV", 5 => "V", 9 => "IX", 10 => "X", 40 => "XL",
                  50 => "L", 90 => "XC", 100 => "C", 400 => "CD", 500 => "D",
                  900 => "CM", 1000 => "M"}

def solution(number)

  result = ""
  nums = ROMAN_NUMERALS.keys.reverse
  left = number
  nums.each do |num|
    next if num > left
    amount = left / num
    result << (ROMAN_NUMERALS[num] * amount)
    left -= (amount * num)
  end
  result

end
