require "lags"

RSpec.describe Lags do
  subject(:flight) { Flight.new(manifest) }

  context "flight" do
    let(:manifest) { "AF514 0 5 10" }

    it "reads id from manifest" do
      expect(flight.id).to eq("AF514")
    end

    it "reads start from manifest" do
      expect(flight.start).to eq(0)
    end

    it "reads finish from manifest" do
      expect(flight.finish).to eq(5)
    end

    it "reads gain from manifest" do
      expect(flight.gain).to eq(10)
    end
  end

  context "another flight" do
    let(:manifest) { "CO5 3 7 14" }

    it "reads id from manifest" do
      expect(flight.id).to eq("CO5")
    end

    it "reads start from manifest" do
      expect(flight.start).to eq(3)
    end

    it "reads finish from manifest" do
      expect(flight.finish).to eq(10)
    end

    it "reads gain from manifest" do
      expect(flight.gain).to eq(14)
    end
  end
end
