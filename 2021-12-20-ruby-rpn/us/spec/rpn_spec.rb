EXAMPLES = {
  "2 3 +" => 5,
  "3 4 +" => 7,
  "30 41 +" => 71,
  "3 1 -" => 2,
  "32 100 -" => -68,
  "-3 -2 *" => 6,
  "4 2 + 3 -" => 3,
  "3 5 8 * 7 + *" => 141,
  "-4 2 /" => -2,
  "2" => 2
}

RSpec.describe do
  EXAMPLES.each do |input, result|
    it "calculates that '#{input}' returns #{result}" do
      expect(rpn(input)).to eq(result)
    end
  end
end
