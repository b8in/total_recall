require_relative 'node'
require_relative 'stack'
require_relative 'linked_list'

puts "\n<- start test ->"

puts "**** begin Stack section ****"
stack = Stack.new
puts "size = #{stack.size}"
puts "peek result = #{stack.peek.inspect}"
stack.push("one")
stack.push(nil)
stack.push("two")
stack.push("three")
puts stack
puts "size = #{stack.length}"
puts "peek result = #{stack.peek}"
puts "peek result = #{stack.peek}"
puts "pop result = #{stack.pop}"
puts "pop result = #{stack.pop}"
puts stack
puts "size = #{stack.size}"
stack.push("four")
stack.push("five")
puts stack
puts "size = #{stack.size}"
puts "index of 'four' #{stack.index_of("four")}"
puts "index of '**' #{stack.index_of("**")}"
puts "index of 'five' #{stack.index_of("five")}"
puts "pop result = #{stack.pop}"
p stack
puts "**** end Stack section ****\n "

ll = LinkedList.new
puts "size = #{ll.length}"
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
puts "size = #{ll.size}"
puts "index of '@@@@@' #{ll.index_of("@@@@@")}"
puts "index of 'absent' #{ll.index_of("absent")}"
puts "removed node = #{ll.remove}"
puts ll
puts "size = #{ll.size}"
puts "removed node = #{ll.remove}"
puts ll
ll.add(777)
puts ll
puts "size = #{ll.size}"
puts "index of 'qwerty' #{ll.index_of("qwerty")}"
puts "index of 777 #{ll.index_of(777)}"
p ll

puts "<- finish test ->\n "