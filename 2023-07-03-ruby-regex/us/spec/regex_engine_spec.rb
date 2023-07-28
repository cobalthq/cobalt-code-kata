require "regex_engine"

# ab|c(d|e)*f
# a+b|c+(d|e)*+f

RSpec.describe RegexEngine do
  it 'Has a definition of "zero"' do
    expect(described_class.new('').preprocess).to eq('')
  end

  it 'Transforms "ab" into "a+b"' do
    expect(described_class.new('ab').preprocess).to eq('a+b')
  end

  it 'Transforms "a*" into "a*"' do
    expect(described_class.new('a*').preprocess).to eq('a*')
  end

  it 'Transforms "ab|c(d)" into "a+b|c+(d)"' do
    expect(described_class.new('ab|c(d)').preprocess).to eq('a+b|c+(d)')
  end

  it 'Transforms "ab|c(d)f" into "a+b|c+(d)+f"' do
    expect(described_class.new('ab|c(d)f').preprocess).to eq('a+b|c+(d)+f')
  end

  it 'Transforms "ab|c(d)(f)" into "a+b|c+(d)+(f)"' do
    expect(described_class.new('ab|c(d)(f)').preprocess).to eq('a+b|c+(d)+(f)')
  end

  it 'Transforms "ab|c(d|e)*f" into "a+b|c+(d|e)*+f"' do
    expect(described_class.new('ab|c(d|e)*f').preprocess).to eq('a+b|c+(d|e)*+f')
  end
end
