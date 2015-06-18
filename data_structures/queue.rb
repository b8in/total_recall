require_relative 'node'
require_relative 'list_base'

class Queue

  include ListBase

  def initialize(value=nil)
    @head = @tail = Node.normalize(value)
  end

  def starting_node
    @head
  end

  def next_node_for(node)
    node.next
  end

  def add(value)
    node = Node.normalize(value)
    unless node.nil?
      if empty?
        @head = @tail = node
      else
        @tail.next = node
        @tail = node
      end
    end
    self
  end
  alias_method :append, :add

  def remove
    if empty?
      result = nil
    else
      result = @head.value
      @head = @head.next
    end
    result
  end

end