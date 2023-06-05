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

def ast_from(string)
  RuboCop::ProcessedSource.new(string, RUBY_VERSION.to_f).ast
end

def deep_deconstruct(node)
  return node unless node.respond_to? :deconstruct

  node.deconstruct.map { |n| deep_deconstruct(n) }
end

def correct_block?(arr)
  case arr
  in [:block, _, [[:arg, var]], *]
    false
  in [:send, [*], _, [:block_pass, _]]
    false
  else
    true
  end
end

p correct_block?(deep_deconstruct(ast_from(code_good1)))
p correct_block?(deep_deconstruct(ast_from(code_good2)))
p correct_block?(deep_deconstruct(ast_from(code_bad1)))
p correct_block?(deep_deconstruct(ast_from(code_bad2)))
