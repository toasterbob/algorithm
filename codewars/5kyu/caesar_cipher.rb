def encode_str(string, shift)
   result = []
   shift = shift % 26
   string.length.times do |i|

     if (string[i] >= "a" && string[i] <= "z") || (string[i] >= "A" && string[i] <= "Z")
       shift.times { string[i] = (string[i].next)[0] }
     end
   end

   string = "#{string[0].downcase}#{string}"
end
