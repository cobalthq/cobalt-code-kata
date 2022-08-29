const { isValidTicTacToeState } = require('./index')

test('empty board is valid', () => {
  expect(isValidTicTacToeState(new Array(9))).toEqual(true)
})

test('2 x in one row should not be valid', () => {
  expect(expect(isValidTicTacToeState(['x', 'x'])).toEqual(false))
})

test('1 0 should not be valid', () => {
  expect(expect(isValidTicTacToeState(['o'])).toEqual(false))
})

/*
x o _
x o _
x o _
*/
test('x has complete column should not be valid', () => {
  expect(expect(isValidTicTacToeState(['x', 'o', '', 'x', 'o', '', 'x', 'o'])).toEqual(false))
})

/*
x _ o
x _ o
x x o
*/
test('x has complete column should not be valid', () => {
  expect(expect(isValidTicTacToeState(['x', '', 'o', 'x', '', 'o', 'x', 'x', 'o'])).toEqual(false))
})

test('x has complete row should not be valid', () => {
  expect(expect(isValidTicTacToeState(['x', 'x', 'x', 'o', 'o', 'o'])).toEqual(false))
})

/*
x o o
_ x o
_ _ x
*/
test('x wins with diagonal', () => {
  expect(expect(isValidTicTacToeState(['x', 'o', 'o', '', 'x', 'o', '', '', 'x'])).toEqual(false))
})

/*
x o x
x o o
o x x
*/
test('final board when no one wins', () => {
  expect(expect(isValidTicTacToeState(['x', 'o', 'x', 'x', 'o', 'o', 'o', 'x', 'x'])).toEqual(true))
})

test('invalid board when too many signs', () => {
  expect(expect(isValidTicTacToeState(['x', 'o', 'x', 'x', 'o', 'o', 'o', 'x', 'x', 'o'])).toEqual(false))
})
