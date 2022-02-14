def non_divisble_by(n)
  rand(100) * n + 1
end

RSpec.describe "fizzbuzz" do
  it "returns 'fizz' for 3" do
    expect(fizzbuzz(3)).to eq("fizz")
  end

  it "returns 'fizz' for 33" do
    expect(fizzbuzz(33)).to eq("fizz")
  end

  it "returns 'fizz' for a fizzy number" do
    num = (rand(100) * 5 + 1) * 3
    expect(fizzbuzz(num)).to eq("fizz")
  end

  it "returns 'buzz' for 5" do
    expect(fizzbuzz(5)).to eq("buzz")
  end

  it "returns 'buzz' for 55" do
    expect(fizzbuzz(55)).to eq("buzz")
  end

  it "returns '1' for 1" do
    expect(fizzbuzz(1)).to eq("1")
  end

  it "returns 'fizzbuzz' for 15" do
    expect(fizzbuzz(15)).to eq("fizzbuzz")
  end

  it "returns 'fizzbuzz' for 30" do
    expect(fizzbuzz(30)).to eq("fizzbuzz")
  end

  it "raises an error when provided a string as an input" do
    expect do
      fizzbuzz("a")
    end.to raise_error("bad input")
  end
end
