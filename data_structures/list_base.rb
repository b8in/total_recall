module ListBase

  def empty?
    starting_node.nil?
  end

  def size
    length = 0
    each_node do |node|
      length += 1
    end
    length
  end
  alias_method :length, :size

  # how many times should execute 'pop' before starting_node value is equal argument
  # if starting_node.value == value then return 0
  def index_of(value)
    index = 0
    each_node do |node|
      return index if node.value == value
      index += 1
    end
    -1
  end

  def include?(value)
    index_of(value) < 0 ? false : true
  end

  def starting_node
    raise NotImplementedError, "You must implement method 'starting_node' in #{self.class.name} class"
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

  def each_node
    if block_given?
      current = starting_node
      until current.nil?
        yield current
        current = current.next
      end
    else
      raise "Method each_node needs a block"
    end
  end

end