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

  def to_s
    buffer = []
    el = @head
    while !el.nil?
      buffer << el.to_s
      el = el.next
    end
    "[#{buffer.join(', ')}]"
  end

  def inspect
    buffer = []
    el = @head
    while !el.nil?
      buffer << el.inspect
      el = el.next
    end
    "LinkedList: ##{object_id} [\n#{buffer.join(",\n")}]"

  end

  private

  def normalize(value)
    return nil if value.nil?
    value.is_a?(Node) ? value : Node.new(value)
  end
end