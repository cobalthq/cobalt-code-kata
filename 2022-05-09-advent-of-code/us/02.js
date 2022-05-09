// const input = `ULL
// RRDDD
// LURDL
// UUUUD`
const fs = require('fs')

const input = fs.readFileSync('02.txt').toString().trim()

var x = 1, y = 1
const numpad = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

const code = input.split("\n").map((line) => {
  for (let index = 0; index < line.length; index++) {
    const letter = line[index];
    switch (letter) {
      case 'U':
          y -= 1
          if (y < 0) y = 0
        break;
      case 'D':
          y += 1
          if (y > 2) y = 2
        break;
      case 'L':
          x -= 1
          if (x < 0) x = 0
        break;
      case 'R':
          x += 1
          if (x > 2) x = 2
        break;

      default:
        break;
    }
  }
  return numpad[y][x]
})

console.log(code)
