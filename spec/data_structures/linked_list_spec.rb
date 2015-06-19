require_relative '../../data_structures/linked_list'
require_relative 'list_base_spec'

RSpec.describe LinkedList do
  include_examples "ListBase module", LinkedList.new("one").add("two").add("three")

end