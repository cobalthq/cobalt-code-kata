function isValidTicTacToeState(board) {
  if (board.length > 9) {
    return false
  }
  const wins = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]
  const countX = board.reduce((acc, e) => (e === 'x' ? acc + 1 : acc), 0)
  const countO = board.reduce((acc, e) => (e === 'o' ? acc + 1 : acc), 0)
  const countXWins = wins.reduce((acc, win) => (
    win.every(index => board[index] === 'x') ? acc + 1 : acc
  ), 0)
  const countOWins = wins.reduce((acc, win) => (
    win.every(index => board[index] === 'o') ? acc + 1 : acc
  ), 0)
  if (countX - countO > 1 || countX - countO < 0) {
    return false
  }
  if (countXWins > 0 && (countOWins > 0 || countO === countX)) {
    return false
  }
  return true
}

module.exports = {
  isValidTicTacToeState,
}
