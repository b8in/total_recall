class Node

  attr_reader :value
  attr_accessor :next
  attr_accessor :prev

  def self.normalize(value)
    return nil if value.nil?
    value.is_a?(Node) ? value : Node.new(value)
  end

  def initialize(value)
    raise ArgumentError, "Node value can't be nil" if value.nil?
    @value = value
  end

  def to_s
    @value.to_s
  end

  def inspect
    "Node ##{object_id}: {value: #{@value}, next: #{oid_or_nil(@next)}, prev: #{oid_or_nil(@prev)}}"
  end

  private

  #return short nice description of node
  def oid_or_nil(node)
    node.nil? ? "nil" : "<#{node.class.to_s} ##{node.object_id}>"
  end

end