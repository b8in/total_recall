class Node

  attr_reader :value
  attr_accessor :next
  attr_accessor :prev

  def initialize(value)
    raise ArgumentError, "Node value can't be nil" if value.nil?
    @value = value
  end

  def to_s
    @value.to_s
  end

  def inspect
    "Node ##{object_id}: {value: #{@value}, next: #{or_nil(@next)}, prev: #{or_nil(@prev)}}"
  end

  private

  #print value or 'nil'
  def or_nil(value)
    "#{value || 'nil'}"
  end

end