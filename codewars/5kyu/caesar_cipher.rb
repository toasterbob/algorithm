def encode_str(string, shift)
   result = []
   first_letter = string[0].downcase
   shift = shift % 26
   string.length.times do |i|

     if (string[i] >= "a" && string[i] <= "z") || (string[i] >= "A" && string[i] <= "Z")
       shift.times { string[i] = (string[i].next)[0] }
     end
   end
   string = "#{first_letter}#{string[0].downcase}#{string}"
   divide = (string.length / 5)
   divide += 1 unless divide * 5 == string.length
   5.times { result << string.slice!(0, divide) }
   result.pop if result.last.length == 0
   result
end

def decode(arr)
  first, second = arr[0].slice!(0,1), arr[0].slice!(0,1)
  n = (second.ord - first.ord) % 26
  arr.join("")
  encode_str(arr.join, n).join[2, -1]
end

# def decode(arr)
#     s = arr.join
#     prefix = s[0..1]
#     n = (prefix[1].ord - prefix[0].ord) % 26
#     encode_str(s[2..-1], -n).join[2..-1]
# end
