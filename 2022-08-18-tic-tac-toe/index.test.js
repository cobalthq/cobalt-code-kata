const { validateBoard } = require('./index')

test('should return true if board is empty', () => {
  const board = [
    [,,],
    [,,],
    [,,],
  ]
  expect(validateBoard(board)).toBe(true)
})
