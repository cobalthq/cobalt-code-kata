NUMERIC_CASES = {
  "5" => 5,
  "1" => 1,
  "0" => 0,
}

OPERATION_CASES = {
  "1 2 +" => 3,
  "3 10 +" => 13,
  "1 2 *" => 2,
  "3 10 *" => 30,
  "6 2 /" => 3,
  "6 3 /" => 2,
  "10 3 -" => 7,
  "3 10 -" => -7,
  "4 2 + 3 -" => 3,
  "4 2 * 3 +" => 11,
  # operation works only on two numbers
  "3 4 2 * +" => 11,
  "6 4 2 + -" => 0,
}

RSpec.describe "rpn" do
  NUMERIC_CASES.each do |input, expected|
    it "returns numeric value for '#{input}'" do
      expect(rpn(input)).to eq(expected)
    end
  end

  OPERATION_CASES.each do |input, expected|
    it "returns #{expected} as a result of '#{input}'" do
      expect(rpn(input)).to eq(expected)
    end
  end
end
