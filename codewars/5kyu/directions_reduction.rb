def dirReduc(arr)
  sorted = true
  (arr.length - 1).times do |i|
    cond1 = arr[i] == "NORTH" && arr[i+1] == "SOUTH"
    cond2 = arr[i] == "SOUTH" && arr[i+1] == "NORTH"
    cond3 = arr[i] == "WEST" && arr[i+1] == "EAST"
    cond4 = arr[i] == "EAST" && arr[i+1] == "WEST"
    if cond1 || cond2 || cond3 || cond4
      arr.slice!(i, 2)
      sorted = false
    end
  end
  if sorted
    arr
  else
    dirReduc(arr)
  end
end 
