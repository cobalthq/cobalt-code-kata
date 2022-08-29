function isValidTicTacToeState(_board) {
  let counto = 0
  let countx = 0

  _board.forEach(move => {
    if(move == 'o') {
      counto++
    } else if(move == 'x') {
      countx++
    }
  })

  if(counto > countx) return false
  if(countx > counto + 1) return false

  return true
}

module.exports = {
  isValidTicTacToeState,
}
