const { fizzBuzz } = require('./index')

test('it returns "fizz" for 3', () => {
  expect(fizzBuzz(3)).toEqual('fizz')
})

test('it returns "fizz" for 9', () => {
  expect(fizzBuzz(9)).toEqual('fizz')
})

test('it returns "buzz" for 5', () => {
  expect(fizzBuzz(5)).toEqual('buzz')
})

test('it returns "buzz" for 10', () => {
  expect(fizzBuzz(10)).toEqual('buzz')
})

test('it returns "fizzbuzz" for 15', () => {
  expect(fizzBuzz(15)).toEqual('fizzbuzz')
})

test('it returns "fizzbuzz" for 30', () => {
  expect(fizzBuzz(30)).toEqual('fizzbuzz')
})

test('it returns "1" for 1', () => {
  expect(fizzBuzz(1)).toEqual('1')
})

const randomIntDivisibleBy = (mul) => Math.ceil(Math.random() * 100) * mul

test('it returns "fizz" for 3x', () => {
  num = randomIntDivisibleBy(5 * 3) - 3
  expect(fizzBuzz(num)).toEqual('fizz')
})

test('it throws an error for "a"', () => {
  expect(() => fizzBuzz('a')).toThrow('Bad')
})
