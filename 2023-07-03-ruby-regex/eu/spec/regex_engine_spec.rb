require "regex_engine"

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
end
