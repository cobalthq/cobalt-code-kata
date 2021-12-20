def rpn(expression)
  rpn_process(expression.split, [])
end

def rpn_process(data, stack)
  return stack.first if data.empty?

  unit = data.shift
  if unit =~ /^\d+$/
    stack.push unit.to_i
    rpn_process(data, stack)
  else
    b = stack.pop
    a = stack.pop
    stack.push([a, b].inject(&:"#{unit}"))
    rpn_process(data, stack)
  end
end
