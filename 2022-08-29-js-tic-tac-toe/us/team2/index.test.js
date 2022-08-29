const { isValidTicTacToeState } = require('./index')

test('empty board is valid', () => {
  expect(isValidTicTacToeState(new Array(9))).toEqual(true)
})

test('the board with one o is invalid', () => {
  expect(isValidTicTacToeState(['o'])).toEqual(false)
})

test('the board with two more xs than os is invalid', () => {
  expect(isValidTicTacToeState(['x', 'x'])).toEqual(false)
})

test('the board with one x and one o is valid', () => {
  expect(isValidTicTacToeState(['x', 'o'])).toEqual(true)
})

test('o can not play after x has won', () => {
  expect(isValidTicTacToeState(['x', 'x', 'x', 'o', 'o', 'o'])).toEqual(false)
})

/*
x _ x
o o o
x _ x
*/
test('o can not play after x has won, neither can x', () => {
  expect(isValidTicTacToeState(['x', '', 'x', 'o', 'o', 'o', 'x', '', 'x'])).toEqual(false)
})

/*
_ x x
x _ x
o o o
*/
test('the bottom row wins', () => {
  expect(isValidTicTacToeState(['', 'x', 'x', 'x', '', 'x', 'o', 'o', 'o'])).toEqual(false)
})
