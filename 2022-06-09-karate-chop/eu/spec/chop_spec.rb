require "timeout"

RSpec.describe "chop" do
  it "returns -1 for an empty array" do
    expect(chop(1, [])).to eq(-1)
  end

  it "returns 0 if found in array of 1" do
    expect(chop(1, [1])).to eq(0)
  end

  it "returns 1 if num is arr[1]" do
    expect(chop(2, [1, 2])).to eq(1)
  end

  it "returns 2 if num is arr[2]" do
    expect(chop(3, [1, 2, 3])).to eq(2)
  end

  it "returns 2 if num is arr[2]" do
    expect(chop(3, [1, 2, 3, 4])).to eq(2)
  end

  it "returns 3 if num is arr[3]" do
    expect(chop(4, [1, 2, 3, 4])).to eq(3)
  end

  it "returns -1 if num is not in the array" do
    expect(chop(4, [1, 2, 3])).to eq(-1)
  end

  it "returns in reasonable time small number" do
    Timeout::timeout(1) do
      expect(chop(1, (0...100000000).to_a)).to eq(1)
    end
  end

  it "returns in reasonable time big number" do
    Timeout::timeout(1) do
      expect(chop(99999998, (0...100000000).to_a)).to eq(99999998)
    end
  end
end
