def sentenceMaker(input_string)
  condition = input_string.include?("{") || input_string.include?("}") || input_string.include?("|")
  return input_string unless condition #this will be the base case for recursively calling this function

  if input_string.include?("{")
    input_string = choiceHelper(input_string) #going to use a helper method
  end
  sentenceMaker(input_string)

end

def choiceHelper(input_string)
  i, start, stop = 0, 0, 0
  loops = true
  while loops
    start = i if input_string[i] == "{"
    if input_string[i] == "}" #if this is the case we have a choice section to breakdown
      stop = i
      choice = input_string[(start + 1)...stop] #taking the choices minus "{" and "}"
      choice = choice.split("|")
      choice = choice[rand(choice.length)] #so now we've broken out a choice
      input_string = "#{input_string[0...start]}#{choice}#{input_string[(stop + 1)..-1]}"
      loops = false
    end
    i += 1
  end
  input_string
end
 
