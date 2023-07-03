require 'rubocop'

# GOOD
code_good1 = <<~RUBY
[1, 2, 3].inject { _1 + _2 }
RUBY
code_good2 = <<~RUBY
[1, 2, 3].each { puts 'a' }
RUBY

# BAD
code_bad1 = <<~RUBY
[1, 2, 3].inject(&:+)
RUBY
code_bad2 = <<~RUBY
[1, 2, 3].inject { |acc, i| acc + i }
RUBY

def ast_from(string)
  RuboCop::ProcessedSource.new(string, RUBY_VERSION.to_f).ast
end

def deep_deconstruct(node)
  return node unless node.respond_to?(:deconstruct)

  node.deconstruct.map { deep_deconstruct(_1) }
end

def has_violation?(arr)
  case arr
  in [:block, [*], [[:arg, _], *], *]
    true
  in [:send, [*], _, [:block_pass, [*]]]
    true
  else
    false
  end
end

p deep_deconstruct(ast_from(code_bad1))
p has_violation?(deep_deconstruct(ast_from(code_bad1)))
p deep_deconstruct(ast_from(code_bad2))
p has_violation?(deep_deconstruct(ast_from(code_bad2)))
p deep_deconstruct(ast_from(code_good1))
p has_violation?(deep_deconstruct(ast_from(code_good1)))
p deep_deconstruct(ast_from(code_good2))
p has_violation?(deep_deconstruct(ast_from(code_good2)))
