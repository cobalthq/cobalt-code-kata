require "regex_engine"

# ab|c(d|e)*f
# a+b|c+(d|e)*+f

RSpec.describe RegexEngine do
  describe '#do_preprocess' do
    it 'Has a definition of "zero"' do
      expect(described_class.new.do_preprocess('')).to eq('')
    end

    it 'Transforms "ab" into "a+b"' do
      expect(described_class.new.do_preprocess('ab')).to eq('a+b')
    end

    it 'Transforms "a*" into "a*"' do
      expect(described_class.new.do_preprocess('a*')).to eq('a*')
    end

    it 'Transforms "ab|c(d)" into "a+b|c+(d)"' do
      expect(described_class.new.do_preprocess('ab|c(d)')).to eq('a+b|c+(d)')
    end

    it 'Transforms "ab|c(d)f" into "a+b|c+(d)+f"' do
      expect(described_class.new.do_preprocess('ab|c(d)f')).to eq('a+b|c+(d)+f')
    end

    it 'Transforms "ab|c(d)(f)" into "a+b|c+(d)+(f)"' do
      expect(described_class.new.do_preprocess('ab|c(d)(f)')).to eq('a+b|c+(d)+(f)')
    end

    it 'Transforms "ab|c(d|e)*f" into "a+b|c+(d|e)*+f"' do
      expect(described_class.new.do_preprocess('ab|c(d|e)*f')).to eq('a+b|c+(d|e)*+f')
    end
  end

  describe '#do_postfix' do
    it '' do
      expect(described_class.new.do_postfix('')).to eq('')
    end

    it 'a' do
      expect(described_class.new.do_postfix('a')).to eq('a')
    end

    it 'a+b' do
      expect(described_class.new.do_postfix('a+b')).to eq('ab+')
    end

    it 'a+b|c' do
      expect(described_class.new.do_postfix('a+b|c')).to eq('ab+c|')
    end

    it 'a+b+c*|d' do
      expect(described_class.new.do_postfix('a+b+c*|d')).to eq('ab+c*+d|')
    end

    it 'a+(b+c)' do
      expect(described_class.new.do_postfix('a+(b+c)')).to eq('abc++')
    end

    it 'a+b|c+(d|e)*+f' do
      expect(described_class.new.do_postfix('a+b|c+(d|e)*+f')).to eq('ab+cde|*+f+|')
    end
  end
end
