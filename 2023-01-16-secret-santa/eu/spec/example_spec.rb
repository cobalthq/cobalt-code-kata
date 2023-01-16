require "example"

RSpec.describe "secret_santa" do
  it "returns emtpy list for no particpants" do
    expect(secret_santa([])).to eq({})
  end

  it "returns error if input is nil" do
    expect{ secret_santa() }.to raise_error(ArgumentError)
  end

  it "works for 2 people" do
    expect(secret_santa(["paul", "sergey"])).to eq({ "paul" => "sergey", "sergey" => "paul" })
  end

  it "returns an error if input is not an array" do
    expect {secret_santa({foo: 'bar'})}.to raise_error(TypeError)
  end

  it "works for 4 people" do
    people = ["paul", "sergey", "mohit", "david"]
    result = secret_santa(people)
    expect(result.keys).to contain_exactly(*people)
    expect(result.values).to contain_exactly(*people)
    found = false
    10.times do
      if secret_santa(people).detect { |santa, kid| result[santa] != kid }
        found = true
        break
      end
    end
    expect(found).to eq(true)
  end
end
