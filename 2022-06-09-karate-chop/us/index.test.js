const { chop } = require('./index')

test('it returns -1 for empty array', () => {
  expect(chop(1, [])).toEqual(-1)
})

test('it returns 0 when the array only contains the target value', () => {
  expect(chop(1, [1])).toEqual(0)
})

test('it returns 1 when the array contains the target value on index 1', () => {
  expect(chop(2, [1, 2])).toEqual(1)
})

test('it returns 2 when the array contains the target value on index 2', () => {
  expect(chop(3, [1, 2, 3])).toEqual(2)
})

const arr = Array(100000000).fill().map((_, i) => i)
test('it finishes in a reasonable time', () => {
  const now = Date.now()
  expect(chop(1, arr)).toEqual(1)
  const after = Date.now()
  console.log(after - now)
})
