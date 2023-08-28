# frozen_string_literal: true

class RegexEngine
  PRECEDENCE = {
    '*' => 0,
    '+' => 1,
    '|' => 2,
  }
  # a b | c (d | e)* f
  # a + b | c + (d | e)* + f
  def prepare(re_spec)
    re_spec.chars.inject do |acc, nxt|
      curr = acc[-1]
      if curr == "(" || nxt == ")"
        acc + nxt
      elsif curr == "|" || nxt == "|" # binary operator
        acc + nxt
      elsif nxt == "*" # unary operator
        acc + nxt
      else
        acc + "+" + nxt
      end
    end
  end

  # a + b | c + (d | e)* + f
  # a b + c d e | * + f + |
  def shunting_yard(prepared_expr)
    result = prepared_expr.chars.each_with_object({stack: [], output: ''}) do |c, acc|
      if c == '('
        acc[:stack].push(c)
      elsif c == ')'
        while acc[:stack].last != '(' do
          acc[:output] += acc[:stack].pop
        end
        acc[:stack].pop
      elsif PRECEDENCE.keys.include?(c)
        while acc[:stack].size > 0 && PRECEDENCE[acc[:stack].last] && PRECEDENCE[acc[:stack].last] <= PRECEDENCE[c] do
          acc[:output] += acc[:stack].pop
        end
        acc[:stack].push(c)
      else
        acc[:output] += c
      end
    end
    result[:output] + result[:stack].join.reverse
  end
end
