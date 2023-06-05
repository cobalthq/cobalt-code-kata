require 'rubocop'

# GOOD
code_good1 = <<~RUBY
[1, 2, 3].map { _1.to_s }
RUBY
code_good2 = <<~RUBY
[1, 2, 3].each { puts 'a' }
RUBY

# BAD
code_bad1 = <<~RUBY
[1, 2, 3].map(&:to_s)
RUBY
code_bad2 = <<~RUBY
[1, 2, 3].map { |i| i.to_s }
RUBY
