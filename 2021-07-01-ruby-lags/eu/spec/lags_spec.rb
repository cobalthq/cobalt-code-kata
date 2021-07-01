require "lags"

RSpec.describe Lags do
  subject(:lags) { Lags.new(flights) }

  context "one flight" do
    let(:flights) { [Flight.new("AF514 0 5 10")] }

    it "if only one flight is available this is the answer" do
      expect(lags.gain).to eq(10)
    end
  end

  context "another flight" do
    let(:flights) { [Flight.new("AF514 0 5 15")] }

    it "if only one flight is available this is the answer" do
      expect(lags.gain).to eq(15)
    end
  end
end
