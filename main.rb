require_relative "./HashMap"
require_relative "./HashSet"

#Test HashMap

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

puts test

#Testing override

test.set('ice cream', 'black')
test.set('jacket', 'red')
test.set('kite', 'orange')

puts test

#Test expand

test.set('moon', 'silver')

puts test

#Testing override

test.set('carrot', 'yellow')
test.set('dog', 'black')
test.set('elephant', 'grey')

puts test

#Testing get

puts test.get('carrot')
puts test.get('sun')

#Testing has?

puts test.has?('carrot')
puts test.has?('sun')

#Testing remove

puts test.remove('carrot')

puts test

#Testing length

puts test.length


#Testing keys

puts "Keys: "
puts test.keys

#Testing values

puts "Values: "
puts test.values

#Testing entries
puts "Entries:"
puts test.entries.to_s

#Testing clear

puts test.clear

#Test HashSet

test = HashSet.new

test.set('apple')
test.set('banana')
test.set('carrot')
test.set('dog')
test.set('elephant')
test.set('frog')
test.set('grape')
test.set('hat')
test.set('ice cream')
test.set('jacket')
test.set('kite')
test.set('lion')

puts test

#Testing override

test.set('ice cream')
test.set('jacket')
test.set('kite')

puts test

#Test expand

test.set('moon')

puts test

#Testing override

test.set('carrot')
test.set('dog')
test.set('elephant')

puts test

#Testing has?

puts test.has?('carrot')
puts test.has?('sun')

#Testing remove

test.remove('carrot')

puts test

#Testing length

puts test.length


#Testing keys

puts "Keys: "
puts test.keys.to_s

#Testing entries
puts "Entries:"
puts test.entries.to_s

#Testing clear

puts test.clear