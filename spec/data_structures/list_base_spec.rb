##
##  WARNING:
##    instance 'populated_list' should have exact 3 (three) nodes
##

RSpec.shared_examples "ListBase module" do |populated_list|

  let(:empty_list) { described_class.new }
  let(:list) { described_class.new("value") }

  describe '.new' do
    context "without arguments" do
      it 'raises no errors' do
        expect { described_class.new }.to_not raise_error
      end

      it 'creates empty instance' do
        expect(described_class.new.empty?).to be true
      end
    end

    context 'with one argument' do
      it 'creates instance with one node' do
        expect(list.size).to eq 1
      end

      it 'takes a Node' do
        expect { described_class.new(Node.new("element")) }.to_not raise_error
        expect(described_class.new(Node.new("element")).starting_node.value).to eq "element"
      end

      it 'takes any object and wraps it in Node' do
        expect { described_class.new("element") }.to_not raise_error
        expect(described_class.new("element").starting_node).to be_a Node
      end
    end
  end

  describe "#empty?" do
    context "when instance is empty" do
      it "returns true" do
        expect(empty_list.empty?).to be true
      end
    end

    context "when instance isn't empty" do
      it "returns false" do
        expect(list.empty?).to be false
      end
    end
  end

  describe "#size" do
    context "when instance is empty" do
      it "returns 0 (zero)" do
        expect(empty_list.size).to eq(0)
      end
    end

    context "when instance has only one node" do
      it "returns 1 (one)" do
        expect(list.length).to eq(1)
      end
    end

    context "when instance has 3 nodes" do
      it "returns 3 (three)" do
        expect(populated_list.size).to eq(3)
      end
    end
  end

  describe "include?" do
    context "when instance contains element" do
      it "return true" do
        expect(list.include?("value")).to be true
      end
    end

    context "when instance not contains element" do
      it "return false" do
        expect(list.include?("absent")).to be false
      end
    end
  end

  describe "#to_s" do
    context "when instance is empty" do
      it "returns []" do
        expect(empty_list.to_s).to eq("[]")
      end
    end

    context "when size=3 and use custom separator '-'" do
      it "result contains '-' twice" do
        expect(populated_list.to_s('-')).to match(/\A\[[a-z]+\-[a-z]+\-[a-z]+\]\z/)
      end
    end
  end

  describe "#inspect" do
    it "result starts with '#{described_class}'" do
      expect(empty_list.inspect).to start_with("#{described_class}")
    end
  end

end