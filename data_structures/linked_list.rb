require_relative 'node'

class LinkedList

  def initialize(value=nil)
    @head = normalize(value)
  end

  def empty?
    @head.nil?
  end

  def insert(value, index=Float::INFINITY)
    el = normalize(value)
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
        el.next = current.next #unless current.next.nil?
        current.next = el
      end
    end
    self
  end

  alias_method :add, :insert

  def remove
    raise "method is not implemented now"
  end

  def to_s(separator=', ')
    buffer = []
    each_node do |node|
      buffer << node.to_s
    end
    "[#{buffer.join(separator)}]"
  end

  def inspect
    buffer = []
    each_node do |node|
      buffer << node.inspect
    end
    "LinkedList ##{object_id} [\n#{buffer.join(",\n")}]"
  end

  private

  def normalize(value)
    return nil if value.nil?
    value.is_a?(Node) ? value : Node.new(value)
  end

  def each_node
    if block_given?
      current = @head
      until current.nil?
        yield current
        current = current.next
      end
    else
      raise "Method each_node needs a block"
    end
  end
end