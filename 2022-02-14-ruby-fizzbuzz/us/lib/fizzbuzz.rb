def fizzbuzz(num)
  num = num.to_i
  result = ""
  result += "fizz" if num % 3 == 0
  result += "buzz" if num % 5 == 0
  result = num.to_s if result.empty?

  result
end
