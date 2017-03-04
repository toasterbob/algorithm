
def stockList(listOfArt, listOfCat)
  return "" if listOfArt.empty? || listOfCat.empty?

  result = []
  hash = {}

  listOfArt.each do |arr|
    code, amount = arr.split(" ")
    if hash[code[0]]
      hash[code[0]] += amount.to_i
    else
      hash[code[0]] = amount.to_i
    end
  end

  listOfCat.each do |cat|
    hash[cat] = 0 if hash[cat].nil?
    result << "(#{cat} : #{hash[cat]})"
  end
  result.join(" - ")
end
