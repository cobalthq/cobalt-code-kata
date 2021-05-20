const { toRoman } = require('./index')

/**
 * I
 * V
 * X
 * L
 * C
 * D
 * M
 */
test('it returns "I" for 1', () => {
  expect(toRoman(1)).toEqual('I')
})

test('it returns "II" for 2', () => {
  expect(toRoman(2)).toEqual('II')
})

test('it returns "III" for 3', () => {
  expect(toRoman(3)).toEqual('III')
})

test('it returns "V" for 5', () => {
  expect(toRoman(5)).toEqual('V')
})

test('it returns "VI" and "VII" for 6 and 7', () => {
  expect(toRoman(6)).toEqual('VI')
  expect(toRoman(7)).toEqual('VII')
})

test('it returns "X" for 10', () => {
  expect(toRoman(10)).toEqual('X')
})

test('it returns "IV" for 4', () => {
  expect(toRoman(4)).toEqual('IV')
})

test('it returns "IX" for 9', () => {
  expect(toRoman(9)).toEqual('IX')
})

test('it returns "XI" for 11', () => {
  expect(toRoman(11)).toEqual('XI')
  expect(toRoman(12)).toEqual('XII')
  expect(toRoman(13)).toEqual('XIII')
  expect(toRoman(15)).toEqual('XV')
  expect(toRoman(16)).toEqual('XVI')
})

test('it returns "XIV" for 14', () => {
  expect(toRoman(14)).toEqual('XIV')
})

test('it returns "XIX" for 19', () => {
  expect(toRoman(19)).toEqual('XIX')
})

test('it returns "XX" for 20', () => {
  expect(toRoman(20)).toEqual('XX')
  expect(toRoman(30)).toEqual('XXX')
})

test('it returns "XL" for 40', () => {
  expect(toRoman(40)).toEqual('XL')
  expect(toRoman(50)).toEqual('L')
  expect(toRoman(51)).toEqual('LI')
})

test('it returns "XLIV" for 44', () => {
  expect(toRoman(44)).toEqual('XLIV')
})
