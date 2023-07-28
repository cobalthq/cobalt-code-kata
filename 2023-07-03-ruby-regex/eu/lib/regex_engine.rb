# frozen_string_literal: true

class RegexEngine
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
end
