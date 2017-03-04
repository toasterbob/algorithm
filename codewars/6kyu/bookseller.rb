# def stockList(listOfArt, listOfCat)
#   result = []
#   any_results = false
#
#   listOfArt.map! { |pair| pair.split(" ") }
#   listOfArt.map! { |arr| [arr[0], arr[1].to_i] }
#
#   listOfCat.each do |cat|
#     total = 0
#     listOfArt.each {|arr| total += arr[1] if arr[0][0] == cat}
#     result << "(#{cat} : #{total})"
#     any_results = true if total > 0
#   end
#
#   any_results ? result.join(" - ") : ""
# end

def stockList(listOfArt, listOfCat)
  result = []
  any_results = false

  listOfArt.map! { |pair| pair.split(" ") }
  listOfArt.map! { |arr| [arr[0], arr[1].to_i] }

  hash = {}

  listOfArt.each do |arr|
    code, amount = arr
    if hash[code[0]]
      hash[code[0]] += amount
    else
      hash[code[0]] = amount
    end
  end

  listOfCat.each do |cat|
    any_results = true if hash[cat]
    hash[cat] = 0 if hash[cat].nil?
    result << "(#{cat} : #{hash[cat]})"
  end
  any_results ? result.join(" - ") : ""
end
