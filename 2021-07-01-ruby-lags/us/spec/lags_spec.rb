require "lags"

RSpec.describe Lags do
  subject(:lags) { Lags.new(manifest) }

  context "with one flight" do
    let(:manifest) { [Flight.new("AF514", 0, 5, 10)] }

    it "has gain of 10" do
      expect(lags.gain).to eq(10)
    end
  end

  context "with two non-intersecting flights" do
    let(:manifest) do
      [
        Flight.new("AF514", 0, 5, 10),
        Flight.new("F5", 6, 3, 5),
      ]
    end

    it "has gain of 15" do
      expect(lags.gain).to eq(15)
    end
  end

  context "with two intersecting flights" do
    let(:manifest) do
      [
        Flight.new("AF514", 0, 5, 10),
        Flight.new("F5", 3, 3, 5),
      ]
    end

    it "has gain of 10" do
      expect(lags.gain).to eq(10)
    end
  end

  context "with three intersecting flights" do
    let(:manifest) do
      [
        Flight.new("AF514", 0, 5, 10),
        Flight.new("F5", 2, 2, 5),
        Flight.new("F5", 4, 3, 7),
      ]
    end

    it "has gain of 12" do
      expect(lags.gain).to eq(12)
    end
  end

  context "with title problem" do
    let(:manifest) do
      [
        Flight.new("AF514", 0, 5, 10),
        Flight.new("CO5", 3, 7, 14),
        Flight.new("AF515", 5, 9, 7),
        Flight.new("BA01", 6, 9, 8),
      ]
    end

    it "has gain of 18" do
      expect(lags.gain).to eq(18)
    end
  end

  context "with title problem" do
    let(:manifest) do
      [
        Flight.new("AF514", 0, 5, 10),
        Flight.new("CO5", 3, 7, 14),
        Flight.new("AF515", 5, 9, 7),
        Flight.new("BA01", 6, 9, 8),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
        Flight.new("BA02", 6, 9, 1),
      ]
    end

    it "has gain of 18" do
      expect(lags.gain).to eq(18)
    end
  end

  context "with three non-intersecting flights" do
    let(:manifest) do
      [
        Flight.new("AF514", 0, 5, 10),
        Flight.new("F5", 6, 3, 5),
        Flight.new("GH4", 9, 3, 5),
      ]
    end

    it "has gain of 20" do
      expect(lags.gain).to eq(20)
    end
  end
end
