class String
  def kontti
    result = []

    self.split(" ").each do |word|
      if /(?=.*[aeiouyAEIOUY])/.match(word)
        trade = "kontii"
        word.length.times do |i|
          break if i > 5 #bigger than kontti length
          trade[i], word[i] = word[i], trade[i]
          break if %w(a e i o u y).include?(word[i])
        end
        result << "#{word}-#{trade}"
      else
        result << word
      end
    end

    result.join(" ")
  end
end
