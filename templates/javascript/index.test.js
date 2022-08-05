const { example } = require('./index')

test('it is not defined', () => {
  expect(example()).toBeUndefined()
})
