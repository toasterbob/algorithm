#trying to understand the last input and how it works.  realized that {very|extremely} qualified is one choice
#thinking about the best way to parse the results.  if i just look for { it doesn't take into account nested pieces
#so i think i need to look for the closing tag or if there is another { then i need to look for two closing tags, etc...
#i'm going to look at each section parsed by spaces.  that's my intial approach

#{I am|I'm} {working on|starting} this {online |}interview. I hope Cortx thinks I am {{very|extremely} qualified|great|awesome}{!|.}

def sentenceWriter(input_string)
  result = []
  options = ""
  input_string.split(" ").each do |chunk|
    if chunk.include?("{" || "}" || "|") #this is the initial test to see if the chunk includes an option
      if options != ""
        options += " #{chunk}"
      else
        options += chunk
      end
    else
      result << chunk
      options = ""
    end
    #now i need to deal with the options
    if options != ""
      if options.count("{") == options.count("}") #make sure options are complete. if so, main logic for choosing
        parsed_options = options_helper(options) #i'm going to do the logic in a helper method
        result << parsed_options
        options = ""
      end
    end
  end
  result.join(" ")
end

def options_helper(options) #will return an array
  return options unless options.include("{") || options.include("}") || options.include("|")
  #options = options[1..-2] #remove opening and closing {}
                           #this wouldn't work on something like {{very|extremely} qualified|great|awesome}{!|.}
                           #i need a more sophisticated parsing method
  if options.include?("{")
      i, start, stop = 0, 0, 0
      keep_looping = true
      while keep_looping
        start = i if options[i] == "{" #check for opening tags
        if options[i] == "}" #here we have a closing tag so we have a complete option with the last opening tag
          stop = i
          sub_option = options[(start + 1)..(stop - 1)] #so we've taken out the sub option now let's deal with it, minus the tags
          sub_option = options_helper(sub_option)
          keep_looping = false #break loop
          options = options_helper(options[0...start] + sub_option + options[(stop + 1)..-1])
        end
        i += 1
      end

  else
      options = options.split("|") #split the choices into an array
      options = options[rand(options.length)] #choose one of the options
  end


  options
end
