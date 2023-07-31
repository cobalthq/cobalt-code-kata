# frozen_string_literal: true

class RegexEngine
  LETTERS = ('a'..'z').to_a.freeze
  PREV = (LETTERS + %w[) *]).freeze
  NEXT = (LETTERS + %w[(]).freeze
  PRECEDENCE = ['*', '+', '|'].freeze

  def do_preprocess(spec)
    chars = spec.chars
    result = chars.shift || ''
    chars.each do |c|
      result += '+' if PREV.include?(result[-1]) && NEXT.include?(c)
      result += c
    end
    result
  end

  def do_postfix(prep_spec)
    queue = ''
    stack = []
    prep_spec.chars.each do |c|
      if LETTERS.include?(c)
        queue += c
      elsif c == '('
        stack.push(c)
      elsif c == ')'
        while stack.last != '('
          queue += stack.pop
        end
        stack.pop
      else
        while PRECEDENCE.include?(stack.last) &&
            PRECEDENCE.index(stack.last) <= PRECEDENCE.index(c)
          queue += stack.pop
        end
        stack.push(c)
      end
    end
    queue + stack.reverse.join
  end
end
