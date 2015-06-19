require_relative 'node'
require_relative 'list_base'

class Stack

  include ListBase

  def initialize(value=nil)
    @head = Node.normalize(value)
  end

  def starting_node
    @head
  end

  def next_node_for(node)
    node.prev
  end

  def empty!
    @head = nil
    self
  end

  def push(value)
    node = Node.normalize(value)
    unless node.nil?
      node.prev = @head unless empty?
      @head = node
    end
    self
  end

  def pop
    node = @head
    @head = @head.prev unless @head.nil?
    node.nil? ? nil : node.value
  end

  def peek
    !@head.nil? && @head.respond_to?(:value) ? @head.value : nil
  end

end