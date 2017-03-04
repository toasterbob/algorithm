
def stockList(listOfArt, listOfCat)
  return "" if listOfArt.empty? || listOfCat.empty?

  hash = Hash.new(0)

  listOfArt.each do |arr|
    code, amount = arr.split(" ")
    hash[code[0]] += amount.to_i
  end

  listOfCat.map! { |cat| "(#{cat} : #{hash[cat]})" }.join(" - ")

end 
