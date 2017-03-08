class String
  def kontti
    result = []

    self.split(" ").each do |word|
      if /(?=.*[aeiouyAEIOUY])/.match(word)

      else
        result << word
      end
    end
    
    result.join(" ")
  end
end
