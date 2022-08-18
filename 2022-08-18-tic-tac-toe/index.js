const board1 = [
  [],
  [],
  [],
]

function validateBoard(board) {
  
  const sum = board.reduce((result, current) => {
    current.forEach(element => {
      if (element === 'x') {
        result.x += 1
      }
      if (element === 'o') {
        result.o += 1
      }
    });

    return result
  },{x: 0, o: 0})

  const {x, o} = sum

  return x >= o
}

module.exports = {
  validateBoard,
}


