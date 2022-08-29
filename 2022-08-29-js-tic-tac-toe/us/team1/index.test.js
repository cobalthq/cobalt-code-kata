/*
VALID:
. empty field
- count of x is the same or one larger than o
- game ends after 3 in a row in any dir
  - if the 3 in a row is x then there should be one more x than o
  - if the 3 in a row is o then they should be equal
  - can't have more than one winner

  board with indexes:
  0 1 2
  3 4 5
  6 7 8

  3 in a row in any dir
  012
  345
  678
  036
  147
  258
  048
  246

  */


const { isValidTicTacToeState } = require('./index')

test('empty board is valid', () => {
  expect(isValidTicTacToeState(new Array(9))).toEqual(true)
})

test('board with one move by o is invalid', () => {
  const gameBoard = new Array(9)
  gameBoard[0] = 'o'
  expect(isValidTicTacToeState(gameBoard)).toEqual(false)
})

test('board with more moves by o than x is invalid', () => {
  const gameBoard = new Array(9)
  gameBoard[0] = 'o'
  gameBoard[1] = 'o'
  gameBoard[2] = 'x'
  expect(isValidTicTacToeState(gameBoard)).toEqual(false)
})

test('board is invalid when num of x moves is more than +1 greater than o moves', () => {
  const gameBoard = new Array(9)
  gameBoard[0] = 'o'
  gameBoard[1] = 'x'
  gameBoard[2] = 'x'
  gameBoard[3] = 'x'
  expect(isValidTicTacToeState(gameBoard)).toEqual(false)
})

test('board with two winners is invalid', () => {
  const gameBoard = new Array(9)
  gameBoard[0] = 'o'
  gameBoard[3] = 'o'
  gameBoard[6] = 'o'
  gameBoard[1] = 'x'
  gameBoard[4] = 'x'
  gameBoard[7] = 'x'
  expect(isValidTicTacToeState(gameBoard)).toEqual(false)
})
