const fs = require("fs")

const input = fs.readFileSync("03.txt").toString().trim()

let x = 0, y = 0

const houses = input.split("").reduce((acc, instr) => {
  switch (instr) {
    case "^":
        y += 1
      break;
    case "v":
        y -= 1
      break;
    case "<":
        x -= 1
      break;
    case ">":
        x += 1
      break;
    default:
      break;
  }
  acc[`${x},${y}`] = true
  return acc
}, {"0,0": true})

console.log(Object.keys(houses).length)
