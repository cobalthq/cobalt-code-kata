const { toRoman } = require('./index')

test('it returns "I" for 1', () => {
  expect(toRoman(1)).toEqual('I')
})
