# frozen_string_literal: true

def secret_santa(people)
  raise TypeError.new unless people.is_a?(Array)

  copy = people.shuffle
  result = copy.each_cons(2).each_with_object({}) do |(santa, kid), re|
    re[santa] = kid
  end
  result[copy.last] = copy.first unless copy.empty?

  result
end
