require_relative 'node'
require_relative 'stack'
require_relative 'linked_list'

puts "\n<- start test ->"

puts "**** begin Stack section ****"
stack = Stack.new
stack.push("one")
stack.push(nil)
stack.push("two")
stack.push("three")
puts stack
puts "pop result = #{stack.pop}"
puts "pop result = #{stack.pop}"
puts stack
stack.push("four")
stack.push("five")
puts stack
puts "pop result = #{stack.pop}"
p stack
puts "**** end Stack section ****\n "

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
ll.add "333333"
ll.add 1111
ll.add "$$$", 1
ll.add "@@@@@", 3
ll.add "% % %", 1000

puts ll
puts "removed node = #{ll.remove}"
puts ll
puts "removed node = #{ll.remove}"
puts ll
ll.add(777)
puts ll
p ll

puts "<- finish test ->\n "