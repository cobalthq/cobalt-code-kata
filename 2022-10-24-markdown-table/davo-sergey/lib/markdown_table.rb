# frozen_string_literal: true

def format_markdown_table(input)
  col_regex = /(?<=\|) ([^|]+) \|/
  lengths = input.each_line.map do |line|
    line.scan(col_regex).map do |md|
      md[0].size
    end
  end
  col_widths = lengths.transpose.map(&:max)
  input.each_line.map do |line|
    line.gsub(col_regex).with_index do |md, col|
      group = Regexp.last_match[1]
      if group.size < col_widths[col]
        first_char = group[0]
        md.sub(group, group + (first_char == '-' ? first_char : ' ')*(col_widths[col] - group.size))
      else
        md
      end
    end
  end.join
end
