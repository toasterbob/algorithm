class String
  def kontti
    result = []

    self.split(" ").each do |word|
      if /(?=.*[aeiouyAEIOUY])/.match(word)
        trade = "kontti"
        breakpoint = nil
        word.length.times do |i|
          breakpoint = i
          break if %w(a e i o u y).include?(word[i])
        end
        result << "#{trade[0, 2]}#{word[breakpoint + 1, word.length]}-#{word[0, breakpoint+1]}#{trade[2, trade.length]}"
      else
        result << word
      end
    end

    result.join(" ")
  end
end
