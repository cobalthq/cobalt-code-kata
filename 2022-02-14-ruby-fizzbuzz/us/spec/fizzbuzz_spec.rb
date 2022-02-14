RSpec.describe "fizzbuzz" do
  it "returns '1' when input is 1" do
    expect(fizzbuzz(1)).to eq("1")
  end

  it "returns '2' when input is 2" do
    expect(fizzbuzz(2)).to eq("2")
  end

  it "returns '-2' when input is -2" do
    expect(fizzbuzz(-2)).to eq("-2")
  end

  it "returns string representation when input is a non-fizz-bussy number" do
    digits = "12478"
    output = digits[rand(digits.length)]
    expect(fizzbuzz(output.to_i)).to eq(output)
  end

  it "returns 'fizz' when input is 3" do
    expect(fizzbuzz(3)).to eq("fizz")
  end

  it "returns 'fizz' when input is 33" do
    expect(fizzbuzz(33)).to eq("fizz")
  end

  it "returns 'buzz' when input is 5" do
    expect(fizzbuzz(5)).to eq("buzz")
  end

  it "returns 'buzz' when input is 10" do
    expect(fizzbuzz(10)).to eq("buzz")
  end

  it "returns 'fizzbuzz' when input is 15" do
    expect(fizzbuzz(15)).to eq("fizzbuzz")
  end

  it "returns 'fizzbuzz' when input is 15" do
    expect(fizzbuzz(30)).to eq("fizzbuzz")
  end

  it "returns 'fizzbuzz' when input is '15'" do
    expect(fizzbuzz('15')).to eq("fizzbuzz")
  end

  it "returns 'fizzbuzz' when input is 'xx'" do
    expect(fizzbuzz('xx')).to eq("fizzbuzz")
  end

  it "returns 'fizzbuzz' when input is 15.123456" do
    expect(fizzbuzz(15.123456)).to eq("fizzbuzz")
  end

  it "returns 'fizzbuzz' when input is '15.123456'" do
    expect(fizzbuzz('€15.123456')).to eq("fizzbuzz")
  end
end
