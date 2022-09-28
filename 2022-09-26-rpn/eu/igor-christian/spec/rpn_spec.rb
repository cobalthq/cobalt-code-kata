require "rpn"

RSpec.describe Rpn do
  subject(:rpn) { described_class.new }

  # https://codingdojo.org/kata/RPN/

  # 2             => 2
  # 20 5 /        => 20/5 = 4
  # 4 2 + 3 -     => (4+2)-3 = 3
  # 3 5 8 * 7 + * => ((5*8)+7)*3 = 141
  # 3 5 8 10 * * 7 + * => ((5*8*10)+7)*3 = 1221
  # 3 5 8 10.5 * * 7 + * => ((5*8*10.5)+7)*3 = 1221

  it 'returns 2' do
    expect(rpn.run("2")).to eq(2)
  end

  it 'returns 4' do
    expect(rpn.run("20 5 /")).to eq(4)
  end

  it 'returns 3' do
    expect(rpn.run("4 2 + 3 -")).to eq(3)
  end

  it 'returns 141' do
    expect(rpn.run("3 5 8 * 7 + *")).to eq(141)
  end

  it 'returns 1221' do
    expect(rpn.run("3 5 8 10 * * 7 + *")).to eq(1221)
  end

  it 'returns 1281' do
    expect(rpn.run("3 5 8 10.5 * * 7 + *")).to eq(1281)
  end

  it 'raises an error' do
    expect { rpn.run("3 * 5") }.to raise_error NoMethodError
  end

  it 'returns 0' do
    expect(rpn.run("")).to eq(0)
  end
end
