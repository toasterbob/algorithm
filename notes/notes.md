

"string".is_a?(String) # => true
"string".is_a?(Object) # => true (everything is an object)

(3.3).round # => 3

[1, 2, 3].index(42) # find the position of 42 in the array
# => nil (nil isn't in the array)

die_faces = [1, 2, 3, 4, 5, 6]

roll1 = die_faces.sample

"  hello  ".strip # => "hello" - removes all white space and returns

"hello".gsub(/[aeiou]/, '*') #=> "h*ll*"

def say_hello(name)
  puts "Hey there, #{name}!"
end

if $PROGRAM_NAME == __FILE__
  name = gets.chomp
  say_hello(name)
end

##RSPEC

bundle exec rspec spec/00_hello_spec.rb:9

#runs file within a specific block


##Blocks

It's very, very common to have blocks that take an argument and call a single method:

["a", "b", "c"].map { |str| str.upcase } # upcase all strings
[1, 2, 5].select { |num| num.odd? }
In this case, Ruby gives us a shortcut:

["a", "b", "c"].map(&:upcase)
[1, 2, 5].select(&:odd?)

def run_block
  yield if block_given?
end

run_block 
