def rpn(input)
  input.scan(/\S+/).inject([]) do |acc, expr|
    if expr.to_i.to_s == expr
      acc + [expr.to_i]
    else
      acc[..-3] + [acc[-2..].inject(&:"#{expr}")]
    end
  end.last
end
