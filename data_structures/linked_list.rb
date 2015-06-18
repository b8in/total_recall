require_relative 'node'
require_relative 'list_base'

class LinkedList

  include ListBase

  def initialize(value=nil)
    @head = Node.normalize(value)
  end

  def starting_node
    @head
  end

  def next_node_for(node)
    node.next
  end

  def insert(value, index=Float::INFINITY)
    el = Node.normalize(value)
    unless el.nil?
      if empty?
        @head = el
      elsif index==0
        el.next = @head
        @head = el
      else
        current = @head
        i = 1
        while current.next && i < index
          current = current.next
          i += 1
        end
        el.next = current.next
        current.next = el
      end
    end
    self
  end

  alias_method :add, :insert

  def remove
    if empty?
      result = nil
    elsif @head.next.nil?
      result = @head
      @head = nil
    else
      current = @head
      while current.next && current.next.next
        current = current.next
      end
      result = current.next
      current.next = result.next
    end
    result
  end

end