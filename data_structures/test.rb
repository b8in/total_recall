require_relative 'node'
require_relative 'linked_list'

puts "\n<- start test ->"
ll = LinkedList.new
ll.add nil
ll.add nil
ll.add nil
ll.add "qwerty"
ll.add Node.new([3,2,1])
ll.add 56
ll.add nil
ll.add nil
ll.add nil
puts ll
p ll

puts "<- finish test ->\n "