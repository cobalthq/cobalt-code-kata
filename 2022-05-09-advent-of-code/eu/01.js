const fs = require("fs")

input = fs.readFileSync("01.txt").toString()

let num = 0

for (let index = 0; index < input.length; index++) {
  const directive = input[index];
  if (directive == "(") {
    num++
  } else if (directive == ")") {
    num--
  }
  if (num == -1) {
    console.log(index + 1)
    process.exit(0)
  }
}

console.log(num)
