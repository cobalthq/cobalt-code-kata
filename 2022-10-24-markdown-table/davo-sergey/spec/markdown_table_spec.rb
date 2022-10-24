require "markdown_table"

RSpec.describe 'format_markdown_table' do
  EXAMPLES = [
    {
      input:  "| Data |\n" \
              "",
      output: "| Data |\n" \
              "",
    },
    {
      input:  "| Data |\n" \
              "| -- |",
      output: "| Data |\n" \
              "| ---- |",
    },
    {
      input:  "| Data |\n" \
              "| -- |\n" \
              "| ItWorks! |",
      output: "| Data     |\n" \
              "| -------- |\n" \
              "| ItWorks! |",
    },
    {
      input:  "| Data | Other |\n" \
              "| No | It Works! |",
      output: "| Data | Other     |\n" \
              "| No   | It Works! |",
    },
  ]

  EXAMPLES.each do |example|
    it "evaluates '#{example[:input].inspect}' to '#{example[:output].inspect}'" do
    expect(format_markdown_table(example[:input])).to eq(example[:output])
    end
  end
end
