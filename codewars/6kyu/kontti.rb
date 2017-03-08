class String
  def kontti
    result = []

    self.split(" ").each do |word|
      if /(?=.*[aeiouyAEIOUY])/.match(word)
        trade = "kontii"
        word.length.times do |i|
          break if i > 5 #bigger than kontti length
          
        end
      else
        result << word
      end
    end

    result.join(" ")
  end
end
