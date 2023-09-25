require "regex_engine"
require "state_machine"

RSpec.describe RegexEngine do
  subject(:engine) { described_class.new }

  describe '#prepare' do
    it 'prepares "ab" as "a+b"' do
      expect(engine.prepare("ab")).to eq("a+b")
    end

    it 'prepares "ab|c" as "a+b|c"' do
      expect(engine.prepare("ab|c")).to eq("a+b|c")
    end

    it 'prepares "ab|c(d)" as "a+b|c+(d)"' do
      expect(engine.prepare("ab|c(d)")).to eq("a+b|c+(d)")
    end

    it 'prepares "ab|c(d|e)*" as "a+b|c+(d|e)*"' do
      expect(engine.prepare("ab|c(d|e)*")).to eq("a+b|c+(d|e)*")
    end

    it 'prepares "ab*|c(d|e)*f" as "a+b*|c+(d|e)*+f"' do
      expect(engine.prepare("ab*|c(d|e)*f")).to eq("a+b*|c+(d|e)*+f")
    end
  end

  describe '#shunting_yard' do
    it 'transforms "a+b" to "ab+"' do
      expect(engine.shunting_yard('a+b')).to eq('ab+')
    end

    it 'transforms "a+b+c" to "ab+c+"' do
      expect(engine.shunting_yard('a+b+c')).to eq('ab+c+')
    end

    it 'transforms "a|b+c" to "abc+|"' do
      expect(engine.shunting_yard('a|b+c')).to eq('abc+|')
    end

    it 'transforms "a|b+c" to "abc+|"' do
      expect(engine.shunting_yard('a|b+c')).to eq('abc+|')
    end

    it 'transforms "a|b+c+d|f" to "abc+d+|f|"' do
      expect(engine.shunting_yard('a|b+c+d|f')).to eq('abc+d+|f|')
    end

    it 'transforms "a|b*+c" to "ab*c+|"' do
      expect(engine.shunting_yard('a|b*+c')).to eq('ab*c+|')
    end

    it 'transforms "a|(b+c)*" to "abc+*|"' do
      expect(engine.shunting_yard('a|(b+c)*')).to eq('abc+*|')
    end

    it 'transforms "a|(b|c+d)*" to "abcd+|*|"' do
      expect(engine.shunting_yard('a|(b|c+d)*')).to eq('abcd+|*|')
    end

    it 'transforms "a+b|c+(d|e)*+f" to "ab+cde|*+f+|"' do
      expect(engine.shunting_yard('a+b|c+(d|e)*+f')).to eq('ab+cde|*+f+|')
    end
  end

  describe 'DFA (state machine)' do
    it 'works' do
      sm = StateMachine.new('', {start: '1', finish: '1'})
      expect(sm.parse('')).to eq(true)
    end

    it 'transitions to finish when edge matches' do
      sm = StateMachine.new('1 a 2', {start: '1', finish: '2'})
      expect(sm.parse('a')).to eq(true)
    end

    it 'transitions to error when edge does not match' do
      sm = StateMachine.new('1 a 2', {start: '1', finish: '2'})
      expect(sm.parse('b')).to eq(false)
    end

    it 'transitions to finish when edge not matches the path' do
      sm = StateMachine.new('1 b 2
2 y 3
3 e 5
1 h 4
4 i 5', {start: '1', finish: '5'})
      expect(sm.parse('hi')).to eq(true)
    end

    it 'transitions to error when edge does not match' do
      sm = StateMachine.new('1 b 2
2 y 3
3 e 5
1 h 4
4 i 5', {start: '1', finish: '5'})
      expect(sm.parse('bypass')).to eq(false)
    end

    it 'transitions to finish when edge does not match' do
      sm = StateMachine.new('1 b 2
2 y 3
3 e 5
1 h 4
4 i 5', {start: '1', finish: '5'})
      expect(sm.parse('by')).to eq(false)
    end
  end

  describe 'NFA' do
    it 'transitions to .finish when edge matches' do
      sm = StateMachine.new('1 h 2
      2  3
      3 i 4', {start: '1', finish: '4'})
      expect(sm.parse('hi')).to eq(true)
    end

    it 'transitions to finish when edge matches' do
      sm = StateMachine.new('1 h 2
      2 i 2
      2  3', {start: '1', finish: '3'})
      expect(sm.parse('h')).to eq(true)
    end

    it 'transitions to finish when edge matches with one i' do
      sm = StateMachine.new('1 h 2
      2 i 2
      2  3', {start: '1', finish: '3'})
      expect(sm.parse('hi')).to eq(true)
    end

    it 'transitions to .finish when edge matches with more i' do
      sm = StateMachine.new('1 h 2
      2 i 2
      2  3', {start: '1', finish: '3'})
      expect(sm.parse('hiiiiii')).to eq(true)
    end

    it 'transitions to error when edge does not match' do
      sm = StateMachine.new('1 h 2
      2 i 2
      2  3', {start: '1', finish: '3'})
      expect(sm.parse('bypass')).to eq(false)
    end
  end
end
