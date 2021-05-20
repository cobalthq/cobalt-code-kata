const { toRoman } = require('./index')

/**
 * I
 * V
 * X
 */

test('it returns proper single roman numerlals for corresponding numbers', () => {
  resultMap = {
    1: 'I',
    5: 'V',
    10: 'X',
  }
  for (const num in resultMap) {
    const result = toRoman(parseInt(num))
    expect(result).toEqual(resultMap[num])
  }
})

test('it raises error when input is not a number', () => {
  expect(() => toRoman({})).toThrow('Bad input')
  expect(() => toRoman('a')).toThrow('Bad input')
})

test('it returns "II" for 2 and "III" for 3', () => {
  expect(toRoman(2)).toEqual('II')
  expect(toRoman(3)).toEqual('III')
})

test('it returns "IV" for 4', () => {
  expect(toRoman(4)).toEqual('IV')
})

test('it returns "VI" "VII" "VIII" for 6 7 8', () => {
  expect(toRoman(6)).toEqual('VI')
  expect(toRoman(7)).toEqual('VII')
  expect(toRoman(8)).toEqual('VIII')
})

test('it returns "IX" for 9', () => {
  expect(toRoman(9)).toEqual('IX')
})

test('it returns "XI" "XII" "XIII" for 11 12 13', () => {
  expect(toRoman(11)).toEqual('XI')
  expect(toRoman(12)).toEqual('XII')
  expect(toRoman(13)).toEqual('XIII')
})
