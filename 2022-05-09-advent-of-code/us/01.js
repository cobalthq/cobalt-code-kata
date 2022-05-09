const fs = require('fs')

const input = fs.readFileSync('01.txt').toString().trim()

const NORTH = 0
const EAST = 1
const SOUTH = 2
const WEST = 3

var position = [0, 0]
let direction = NORTH
const path = {[position]: true}
input.split(', ').forEach(instr => {
// 'R8, R4, R4, R8'.split(', ').forEach(instr => {
  console.log(path)
  const turnTo = instr[0]
  const distance = parseInt(instr.slice(1), 10)

  // will work on another step
  if(turnTo == 'L') {
      direction -= 1
      if(direction < NORTH) {
          direction = WEST
      }
  } else if (turnTo == 'R') {
      direction += 1
      if(direction > WEST) {
          direction = NORTH
      }
  }

  console.log("dir is " + direction)
  for (let index = 1; index <= distance; index++) {
    switch (direction) {
      case NORTH:
        position = [position[0], position[1]+1]
        break;
      case EAST:
        position = [position[0]+1, position[1]]
        break;
      case WEST:
        position = [position[0]-1, position[1]]
        break;
      case SOUTH:
        position = [position[0], position[1]-1]
        break;

      default:
        break;
    }

    if (path[position]) {
      console.log(Math.abs(position[0]) + Math.abs(position[1]))
      process.exit()
    }
    path[position] = true
  }
})
console.log(Math.abs(position[0]) + Math.abs(position[1]))
