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

    context 'with NFA' do
      subject(:sm) do
        transitions = <<~TEXT
        1 h 2
        2  3
        3 i 4
        TEXT
        described_class.new(transitions, {start: 1, finish: 4})
      end

      it 'matches "hi"' do
        expect(sm.run('hi')).to eq(true)
      end

      it 'matches "bypass"' do
        expect(sm.run('bypass')).to eq(false)
      end
    end

    context 'with NFA and * (sort of)' do
      subject(:sm) do
        transitions = <<~TEXT
        1 h 2
        2 i 2
        2  3
        TEXT
        described_class.new(transitions, {start: 1, finish: 3})
      end

      it 'matches "hi"' do
        expect(sm.run('hi')).to eq(true)
      end

      it 'matches "h"' do
        expect(sm.run('h')).to eq(true)
      end

      it 'matches "hiiiii"' do
        expect(sm.run('hiiiii')).to eq(true)
      end

      it 'matches "bypass"' do
        expect(sm.run('bypass')).to eq(false)
      end
    end

    context 'with NFA and many epsilons' do
      subject(:sm) do
        transitions = <<~TEXT
        1  2
        1  4
        2 x 3
        3  2
        3  4
        TEXT
        described_class.new(transitions, {start: 1, finish: 4})
      end

      it 'matches "xx"' do
        expect(sm.run('xx')).to eq(true)
      end

      it 'matches ""' do
        expect(sm.run('')).to eq(true)
      end

      it 'matches "bypass"' do
        expect(sm.run('bypass')).to eq(false)
      end
    end
  end

  describe '#concat' do
    it 'works' do
      m1 = described_class.new('1 a 2', {start: 1, finish: 2})
      m2 = described_class.new('1 b 2', {start: 1, finish: 2})
      m1.concat(m2)
      expect(m1.run('ab')).to eq(true)
      expect(m1.run('a')).to eq(false)
      expect(m1.run('b')).to eq(false)
    end
  end

  describe '#union' do
    it 'works' do
      m1 = described_class.new('1 a 2', {start: 1, finish: 2})
      m2 = described_class.new('1 b 2', {start: 1, finish: 2})
      m1.union(m2)
      expect(m1.run('ab')).to eq(false)
      expect(m1.run('a')).to eq(true)
      expect(m1.run('b')).to eq(true)
    end
  end
end
