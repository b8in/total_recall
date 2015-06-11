require_relative 'node'
require_relative 'list_base'

class Stack

  include ListBase

  def initialize(value=nil)
    @head = Node.normalize(value)
  end

  def push(value)
    node = Node.normalize(value)
    unless node.nil?
      node.next = @head unless empty?
      @head = node
    end
    self
  end

  def pop
    node = @head
    @head = @head.next.nil? ? nil : node.next
    node
  end

end