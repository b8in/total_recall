require_relative '../../data_structures/stack'

RSpec.describe Stack do
  describe '.new' do
    context "without arguments" do
      it 'raise no errors' do
        expect {Stack.new}.to_not raise_error
      end

      it 'creates empty stack' do
        expect(Stack.new.empty?).to be true
      end
    end

    context 'with one argument' do
      it 'creates stack with one node' do
        expect(Stack.new("value").size).to eq 1
      end
    end
  end
end