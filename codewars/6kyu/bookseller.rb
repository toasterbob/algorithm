def stockList(listOfArt, listOfCat)
  result = []
  listOfArt.map do |pair|
    pair.split(" ").map { |code, num| [code, num.to_i] }
  end
  listOfCat.each do |cat|
    total = 0
    listOfArt.each {|arr| total += arr[1] if arr[0][0] == cat}
    result << "(#{cat} : #{total})" if total > 0
  end
  result.join(" - ")
end
