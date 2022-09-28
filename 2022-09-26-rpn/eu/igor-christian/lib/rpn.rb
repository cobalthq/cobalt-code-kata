# frozen_string_literal: true

class Rpn
  def run(input)
    args = input.split(' ')
    return 0 if args.empty?

    stack = []

    args.each do |arg|
      stack << if "+-*/".include?(arg)
        b = stack.pop
        a = stack.pop

        # Will do the following: a <arg> b, e.g. 2 + 5
        a.public_send(arg, b)
      else
        arg.to_f
      end
    end

    stack.pop
  end
end
