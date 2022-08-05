require "example"

RSpec.describe Example do
  subject(:example) { described_class.new }

  it 'works' do
    expect(example.example).to be_nil
  end
end
