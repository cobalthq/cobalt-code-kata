function isValidTicTacToeState(board) {
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
  let oCount = board.reduce((prev, curr) => (curr === 'o' ? prev + 1 : prev), 0)
  let xCount = board.reduce((prev, curr) => (curr === 'x' ? prev + 1 : prev), 0)
  let oWinsCount = wins.reduce((acc, win) => (
    win.every(index => board[index] === 'o') ? acc + 1 : acc
  ), 0)
  let xWinsCount = wins.reduce((acc, win) => (
    win.every(index => board[index] === 'x') ? acc + 1 : acc
  ), 0)

  if (xCount < oCount || xCount > (oCount + 1)) {
    return false
  }
  if (oWinsCount > 0 && xCount != oCount) {
    return false
  }
  if (xWinsCount > 0 && xCount == oCount) {
    return false
  }

  return true
}

module.exports = {
  isValidTicTacToeState,
}
