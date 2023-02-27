const { dictionaryReplace } = require('./index')

test('returns an empty string', () => {
  expect(dictionaryReplace("", {})).toBe("")
})

test('return a single replacement', () => {
  expect(dictionaryReplace("$temp$", { "temp": "temporary" })).toBe("temporary")
})

test('return a double replacement', () => {
  expect(dictionaryReplace("$temp$ $temp$", { "temp": "temporary" })).toBe("temporary temporary")
})

test('return a double replacement with a catch', () => {
  expect(dictionaryReplace("$name$temp$temp$", { "temp": "temporary", "name": "John Doe" })).toBe("John Doetemptemporary")
})

test('return a str with a dollar sign', () => {
  expect(dictionaryReplace("$$$price$", { "price": 16 })).toBe("$16")
})
