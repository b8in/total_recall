require_relative 'node'

class LinkedList

  def initialize(value=nil)
    @head = normalize(value)
  end

  def empty?
    @head.nil?
  end

  def add(value)
    el = normalize(value)
    if empty?
      @head = el
    else
      tail = @head
      while tail.next
        tail = tail.next
      end
      tail.next = el
    end
  end

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