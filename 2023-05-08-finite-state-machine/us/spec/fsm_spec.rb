require "fsm"

RSpec.describe FSM do
  subject(:fsm) { described_class.new(instructions) }

  let(:instructions) do
    "S1; S1, S2; 9
    S2; S1, S3; 10
    S3; S4, S3; 8
    S4; S4, S1; 0"
  end

  it 'works' do
    expect(fsm.run([0, 1, 1, 0, 1])).to eq(9)
  end
end
