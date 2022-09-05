const { X, O, countMoves, didWin, isValidTicTacToeState } = require('./index')

describe('unit tests', () => {
  test('empty board is valid', () => {
    expect(isValidTicTacToeState(new Array(9))).toEqual(true)
  })

  test('the board with one o is invalid', () => {
    expect(isValidTicTacToeState([O])).toEqual(false)
  })

  test('the board with two more xs than os is invalid', () => {
    expect(isValidTicTacToeState([X, X])).toEqual(false)
  })

  test('the board with one x and one o is valid', () => {
    expect(isValidTicTacToeState([X, O])).toEqual(true)
  })

  test('o can not play after x has won', () => {
    expect(isValidTicTacToeState([X, X, X, O, O, O])).toEqual(false)
  })

  /*
  x _ x
  o o o
  x _ x
  */
  test('o can not play after x has won, neither can x', () => {
    expect(isValidTicTacToeState([X, '', X, O, O, O, X, '', X])).toEqual(false)
  })

  /*
  _ x x
  x _ x
  o o o
  */
  test('the bottom row wins', () => {
    expect(isValidTicTacToeState(['', X, X, X, '', X, O, O, O])).toEqual(false)
  })
})

describe('win conditions', () => {
  /**
   * a a a
   * _ _ _
   * _ _ _
   */
  test('top row wins', () => {
    expect(didWin(X, [X, X, X])).toEqual(true)
    expect(didWin(O, [O, O, O])).toEqual(true)
  })

  /**
   * _ _ _
   * a a a
   * _ _ _
   */
  test('middle row wins', () => {
    expect(didWin(X, [,,,X, X, X])).toEqual(true)
    expect(didWin(O, [,,,O, O, O])).toEqual(true)
  })

  /**
   * _ _ _
   * _ _ _
   * a a a
   */
  test('bottom row wins', () => {
    expect(didWin(X, [,,,,,,X, X, X])).toEqual(true)
    expect(didWin(O, [,,,,,,O, O, O])).toEqual(true)
  })

  /**
   * a _ _
   * a _ _
   * a _ _
   */
  test('left column wins', () => {
    expect(didWin(X, [X,,,X,,,X])).toEqual(true)
    expect(didWin(O, [O,,,O,,,O])).toEqual(true)
  })

  /**
   * _ a _
   * _ a _
   * _ a _
   */
  test('center column wins', () => {
    expect(didWin(X, [,X,,,X,,,X])).toEqual(true)
    expect(didWin(O, [,O,,,O,,,O])).toEqual(true)
  })

  /**
   * _ _ a
   * _ _ a
   * _ _ a
   */
  test('right column wins', () => {
    expect(didWin(X, [,,X,,,X,,,X])).toEqual(true)
    expect(didWin(O, [,,O,,,O,,,O])).toEqual(true)
  })

  /**
   * a _ _
   * _ a _
   * _ _ a
   */
  test('top left to bottom right diagonal wins', () => {
    expect(didWin(X, [X,,,,X,,,,X])).toEqual(true)
    expect(didWin(O, [O,,,,O,,,,O])).toEqual(true)
  })

  /**
   * a _ _
   * _ a _
   * _ _ a
   */
  test('top right to bottom left diagonal wins', () => {
    expect(didWin(X, [,,X,,X,,X])).toEqual(true)
    expect(didWin(O, [,,O,,O,,O])).toEqual(true)
  })
})

describe('count moves', () => {
  test('no moves on empty board', () => {
    expect(countMoves(X, [])).toEqual(0)
    expect(countMoves(O, [])).toEqual(0)
    expect(countMoves(X, Array(9).fill(''))).toEqual(0)
    expect(countMoves(O, Array(9).fill(''))).toEqual(0)
  })

  test('9 moves in full board', () => {
    expect(countMoves(X, Array(9).fill(X))).toEqual(9)
    expect(countMoves(O, Array(9).fill(O))).toEqual(9)
  })

  test('4 and 5 moves in full board', () => {
    const board = [X, O, X, O, X, O, X, O, X]
    expect(countMoves(X, board)).toEqual(5)
    expect(countMoves(O, board)).toEqual(4)
  })
})

describe('exhaustive', () => {
  /**
   * This is a recursive function that exhausts all possible board states.
   * For each turn it takes all possible open positions and records them in
   * states set. Moves stop if the last move was wining. Different games
   * may yield tha same states. That's why we use a set. We don't account
   * for symmetry as our solution doesn't care about it.
   */
  const playMove = (states, board) => {
    const move = countMoves(X, board) > countMoves(O, board) ? O : X
    let nextBoard
    for (let index = 0; index < 9; index++) {
      if (!board[index]) {
        nextBoard = [...board]
        nextBoard[index] = move

        /**
         * Javascript transforms an array to a string in a way that wors for us:
         * ['x', null, undefined, '', 'o'] becomes key 'x,,,,o'.
         * If we make sure prefill our board arrays and keep them the same length
         * this works.
         */
        states[nextBoard] = true
        if (!didWin(move, nextBoard)) {
          states = playMove(states, nextBoard)
        }
      }
    }
    return states
  }

  /**
   * Prefill valid states set with empty field being valid.
   */
  const allValidStates = playMove({[Array(9).fill('')]: true}, Array(9).fill(''))
  const statesCount = Object.keys(allValidStates).length

  /**
   * Randomly find the same amount of unique invalid states.
   * There is more invalid states than there are valid, but for us it might be
   * enough.
   */
  const invalidStates = Array(statesCount).fill('').reduce((acc, _) => {

    /**
     * Random index is 0, 1 or 2 when accessed array [X, O] undefined is the third
     * option with equal possibility.
     */
    let board = Array(9).fill('').map(_ => [X, O][Math.floor(Math.random() * 3)])
    while (allValidStates[board] || acc[board]) {
      board = Array(9).fill('').map(_ => [X, O][Math.floor(Math.random() * 3)])
    }
    acc[board] = true
    return acc
  }, {})

  test.each(Object.keys(allValidStates))(`checks that %s board is valid (total ${statesCount})`, board => {
    expect(isValidTicTacToeState(board.split(','))).toEqual(true)
  })

  test.each(Object.keys(invalidStates))(`checks that %s board is invalid (total ${statesCount})`, board => {
    expect(isValidTicTacToeState(board.split(','))).toEqual(false)
  })
})
