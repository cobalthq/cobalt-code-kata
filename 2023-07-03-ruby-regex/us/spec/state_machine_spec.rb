require "state_machine"

RSpec.describe StateMachine do
  describe '#run' do
    it 'has a zero defined' do
      m = described_class.new('', {start: 1, finish: 1})
      expect(m.run('')).to eq(true)
    end

    it 'fails on zero' do
      m = described_class.new('', {start: 1, finish: 1})
      expect(m.run('a')).to eq(false)
    end

    context 'with the final thing' do
      subject(:sm) do
        transitions = <<~TEXT
        1 b 2
        2 y 3
        3 e 5
        1 h 4
        4 i 5
        TEXT
        described_class.new(transitions, {start: 1, finish: 5})
      end

      it 'matches "hi"' do
        expect(sm.run('hi')).to eq(true)
      end

      it 'matches "bypass"' do
        expect(sm.run('bypass')).to eq(false)
      end
    end
  end
end
