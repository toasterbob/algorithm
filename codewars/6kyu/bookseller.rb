def stockList(listOfArt, listOfCat)
  result = []
  any_results = false

  listOfArt.map! { |pair| pair.split(" ") }
  listOfArt.map! { |arr| [arr[0], arr[1].to_i] }

  listOfCat.each do |cat|
    total = 0
    listOfArt.each {|arr| total += arr[1] if arr[0][0] == cat}
    result << "(#{cat} : #{total})"
    any_results = true if total > 0
  end

  any_results ? result.join(" - ") : "" 
end
