def stockList(listOfArt, listOfCat)
  result = []
  listOfArt.map! { |pair| pair.split(" ") }

  p listOfArt
  listOfCat.each do |cat|
    total = 0
    listOfArt.each {|arr| total += arr[1] if arr[0][0] == cat}
    result << "(#{cat} : #{total})" if total > 0
  end
  result.join(" - ")
end
