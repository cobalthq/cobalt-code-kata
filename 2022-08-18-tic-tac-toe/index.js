const validateBoard = (board) => {
  
  const sum = board.reduce((result, current) => {
    current.forEach(element => {
      if (element) {
        result[element] += 1
      }
    });

    return result
  },{x: 0, o: 0})

  const {x, o} = sum

  return x >= o && x <= o + 1
}

module.exports = {
  validateBoard,
}


