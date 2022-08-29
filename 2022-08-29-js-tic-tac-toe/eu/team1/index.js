function isValidTicTacToeState(_board) {
  const { countO, countX } = count(_board)

  if (countO > countX || countX > countO + 1 ) {
    return false
  }

  const winner = whoWon(_board)

  return true
}

function whoWon(_board) {

  for (let i = 0; i < _board.length; i++) {
    const row = _board[i]

    if (row[0] === row[1] && row[1] === row[2] && row[2] === 'x') {
      return 'X'
    }
    if (row[0] === row[1] && row[1] === row[2] && row[2] === 'o') {
      return 'O'
    }
  }

  return 'X'
}

function count(_board) {
  let countO = 0
  let countX = 0

  _board.forEach((row) => {
    row.forEach((char) => {
      if (char === 'o') {
        countO += 1
      }

      if (char === 'x') {
        countX += 1
      }
    })
  });

  return { countO, countX }
}

module.exports = {
  isValidTicTacToeState,
}
