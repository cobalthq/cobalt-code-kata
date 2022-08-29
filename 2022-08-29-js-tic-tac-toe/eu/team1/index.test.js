const { isValidTicTacToeState } = require('./index')

// First player is 'X'

test('empty board is valid', () => {
  const board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ]

  expect(isValidTicTacToeState(board)).toEqual(true)
})

test('board with more Os than Xs is not valid', () => {
  const board = [
    ['o', 'o', 'o'],
    ['', '', ''],
    ['', '', ''],
  ]

  expect(isValidTicTacToeState(board)).toEqual(false)
})

test('board with equal Os than Xs is valid', () => {
  const board = [
    ['o', 'o', 'o'],
    ['', 'x', ''],
    ['x', 'x', ''],
  ]

  expect(isValidTicTacToeState(board)).toEqual(true)
})

test('board with 2 extra Xs than Os is invalid', () => {
  const board = [
    ['o', 'o', 'o'],
    ['x', 'x', ''],
    ['x', 'x', 'x'],
  ]

  expect(isValidTicTacToeState(board)).toEqual(false)
})

test('board when X has won but O has played again is invalid', () => {
  const board = [
    ['x', '', 'o'],
    ['x', 'o', 'o'],
    ['x', '', ''],
  ]

  expect(isValidTicTacToeState(board)).toEqual(false)
})
