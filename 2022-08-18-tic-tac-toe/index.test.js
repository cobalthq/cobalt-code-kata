const { validateBoard } = require('./index')

test('should return true if board is empty', () => {
  const board = [
    [,,],
    [,,],
    [,,],
  ]
  expect(validateBoard(board)).toBe(true)

})

test('should return false if "o" is first', () => {
  const board = [
    ['o',,],
    [,,],
    [,,],
  ]
  expect(validateBoard(board)).toBe(false)
})

test('should return false if more "x" than "o" + 1', () => {
  const board = [
    ['o','x','x'],
    [,'x',],
    [,,],
  ]
  expect(validateBoard(board)).toBe(false)
})

test('should return false if lot more "x" than "o" + 1', () => {
  const board = [
    ['o','x','o'],
    ['x','x','x'],
    ['x','x', 'o'],
  ]
  expect(validateBoard(board)).toBe(false)
})
