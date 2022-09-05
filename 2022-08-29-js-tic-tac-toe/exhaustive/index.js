const X = 'x'
const O = 'o'

const didWin = (move, board) => {
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
  return wins.some(win => (
    win.every(index => board[index] === move)
  ))
}

const countMoves = (move, board) => (
  board.reduce((prev, curr) => (curr === move ? prev + 1 : prev), 0)
)

const isValidTicTacToeState = (board) => {
  let oCount = countMoves('o', board)
  let xCount = countMoves('x', board)
  let oWon = didWin('o', board)
  let xWon = didWin('x', board)

  if (![0, 1].includes(xCount - oCount)) {
    return false
  }
  if (oWon && xCount != oCount) {
    return false
  }
  if (xWon && xCount == oCount) {
    return false
  }

  return true
}

module.exports = {
  X,
  O,
  countMoves,
  didWin,
  isValidTicTacToeState,
}
