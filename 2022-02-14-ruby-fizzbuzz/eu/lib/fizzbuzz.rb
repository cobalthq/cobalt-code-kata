def fizzbuzz(num)
  raise "bad input" if !num.is_a? Integer

  result = ""
  result += "fizz" if num % 3 == 0
  result += "buzz" if num % 5 == 0
  result = num.to_s if result.empty?

  result
end
