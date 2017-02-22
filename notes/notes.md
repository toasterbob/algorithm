

"string".is_a?(String) # => true
"string".is_a?(Object) # => true (everything is an object)

(3.3).round # => 3

[1, 2, 3].index(42) # find the position of 42 in the array
# => nil (nil isn't in the array)

die_faces = [1, 2, 3, 4, 5, 6]

roll1 = die_faces.sample

"  hello  ".strip # => "hello" - removes all white space and returns 
