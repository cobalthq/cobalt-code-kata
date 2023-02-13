require "example"

RSpec.describe Example do
  subject(:example) { described_class.new }

  it 'works without parameters' do
    expect(example.dict_replace).to eq('')
  end

  it 'replaces one special string pattern with its dict value' do
    dict = { 'temp'=> 'temporary' }
    in_str = '$temp$'

    expect(example.dict_replace(in_str, dict)).to eq('temporary')
  end

  it 'replaces more than one special string patterns with dict values' do
    dict = { 'temp'=> 'temporary', 'other' => 'another one' }
    in_str = '$temp$ test $other$'

    expect(example.dict_replace(in_str, dict)).to eq('temporary test another one')
  end

  it 'does not replace the string pattern in not present in dict' do
    dict = { 'temp'=> 'temporary', 'other' => 'another one' }
    in_str = '$temp$ test $other$ $not_there$'

    expect(example.dict_replace(in_str, dict)).to eq('temporary test another one $not_there$')
  end
end
