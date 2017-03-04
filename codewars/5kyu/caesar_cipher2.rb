def movingShift(s, shift)
    coded = ""
    s.chars do |ch|
      if ch.downcase >= "a" && ch.downcase <= "z"
        shift = shift % 26
        shift += 26 if shift < 0 #for negative shifts
        shift.times {ch.next!}
      end
      coded << ch[-1]
      shift += 1
    end
    arr = []
    divide = s.length/5
    divide += 1 if divide * 5 < s.length
    5.times do |i|
      arr << coded.slice!(0, divide)
    end
    arr
end

def demovingShift(arr, shift)
    coded = ""
    s = arr.join("")
    s.chars do |ch|
      if ch.downcase >= "a" && ch.downcase <= "z"
        shift = shift % 26
        shift2 = 26 - shift # reverse position 
        shift2.times {ch.next!}
      end
      coded << ch[-1]
      shift += 1
    end
    coded
end
