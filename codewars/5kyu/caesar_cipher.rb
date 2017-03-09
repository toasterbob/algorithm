def encode_str(string, shift)
   result = []
   shift = shift % 26
   string.length.times do |i|
     if (i >= "a" && i <= "z") || (i >= "A" && i <= "Z")
       shift.times { string[i] = (string[i].next)[0] }
     end
   end

   string = "#{string[0].downcase}#{string}"
end

def decode(arr)

end
