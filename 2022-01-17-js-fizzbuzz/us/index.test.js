const { fizzBuzz } = require('./index')

test('it returns "fizz" for 3', () => {
  expect(fizzBuzz(3)).toEqual('fizz')
})

test('it returns "fizz" for 6', () => {
  expect(fizzBuzz(6)).toEqual('fizz')
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
  expect(fizzBuzz(15 * 2)).toEqual('fizzbuzz')
})

test('it returns "1" for 1', () => {
  expect(fizzBuzz(1)).toEqual('1')
})

test('it throws an Error for "a"', () => {
  expect(() => fizzBuzz('a')).toThrow('Bad')
})

test('it throws an Error for negative numbers', () => {
  expect(() => fizzBuzz(-3)).toThrow('Bad')
})
