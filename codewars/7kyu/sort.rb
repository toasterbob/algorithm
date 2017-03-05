def sort_by_language(arr)
  new_arr = arr.dup
  new_arr.sort_by { |object| [object[:language], object[:firstName]] }
end
