require "regex_engine"

RSpec.describe RegexEngine do
  subject(:engine) { described_class.new }

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
