require_relative '../../data_structures/stack'
require_relative 'list_base_spec'

RSpec.describe Stack do
  include_examples "ListBase module", Stack.new("one").push("two").push("three")

  let(:stack) { Stack.new("value") }
  let(:populated_stack) { Stack.new("one").push("two").push("three") }
  let(:empty_stack) { Stack.new }

  describe '#starting_node' do
    it 'returns @head' do
      expect(stack.starting_node).to eq stack.instance_variable_get("@head")
    end
  end

  describe "#next_node_for" do
    it 'returns next node of sequence' do
      new_node = Node.new("four")
      old_head = populated_stack.starting_node
      populated_stack.push(new_node)
      expect(populated_stack.next_node_for(populated_stack.starting_node)).to eq old_head
    end
  end

  describe "#index_of" do
    it "returns 0 for head element of stack" do
      expect(populated_stack.index_of("three")).to eq 0
    end

    it "returns 2 for third element of stack" do
      expect(populated_stack.index_of("one")).to eq 2
    end
  end

  describe "#empty!" do
    it "returns blank stack" do
      expect(populated_stack.empty!).to be_a Stack
      expect(populated_stack.empty!.empty?).to be true
    end
  end

  describe "#peek" do
    context "when stack is empty" do
      it "returns nil" do
        expect(empty_stack.peek).to be_nil
      end
    end

    context "when stack isn't empty" do
      it "returns value of stack head" do
        expect(populated_stack.peek).to eq "three"
      end
    end
  end

  describe "#pop" do
    context "when stack is empty" do
      it "returns nil" do
        expect(empty_stack.pop).to be_nil
      end
    end

    context "when stack has only one node" do
      it "returns value of head node" do
        expect(stack.pop).to eq("value")
      end

      it "stack becomes empty" do
        stack.pop
        expect(stack.empty?).to be true
      end
    end

    context "when stack has many nodes" do
      it "returns value of head node" do
        expect(populated_stack.pop).to eq("three")
      end

      it "head becomes previous node" do
        populated_stack.pop
        expect(populated_stack.peek).to eq "two"
      end

      it "stack size decreases by 1" do
        old_size = populated_stack.size
        populated_stack.pop
        expect(populated_stack.size).to eq(old_size-1)
      end
    end
  end

  describe "#push" do
    context "when stack isn't empty" do
      it "new head node has link on previous node" do
        stack.push("new")
        expect(stack.starting_node.prev.value).to eq "value"
      end
    end

    it "stack size increase by 1" do
      old_size = stack.size
      stack.push("new")
      expect(stack.size).to eq(old_size+1)
    end

    it "new node becomes the head" do
      stack.push("new")
      expect(stack.peek).to eq "new"
    end
  end

  describe "#to_s" do
    context "when instance has three elements: 'one', 'two', 'three'" do
      it "returns false" do
        expect(populated_stack.to_s).to eq("[three, two, one]")
      end
    end
  end

  it 'instance has @head variable' do
    expect(stack.instance_variable_get("@head")).to_not be_nil
  end

  it 'instance variable @head is a Node' do
    expect(stack.instance_variable_get("@head")).to be_a Node
  end

end