const fs = require("fs")

const total = fs.readFileSync("02.txt").toString().split("\n").reduce((acc, boxSize) => {
  if (boxSize.length == 0) {
    return acc
  }
  const lengths = boxSize.split("x")
  const areas = [lengths[0]*lengths[1], lengths[1]*lengths[2], lengths[0]*lengths[2]]
  return acc + Math.min(...areas) + areas.reduce((sum, a) => sum + a) * 2
}, 0)

const ribbon = fs.readFileSync("02.txt").toString().split("\n").reduce((acc, boxSize) => {
  if (boxSize.length == 0) {
    return acc
  }
  const lengths = boxSize.split("x").map((s) => parseInt(s))
  const perimeters = [2*(lengths[0]+lengths[1]), 2*(lengths[1]+lengths[2]), 2*(lengths[0]+lengths[2])]
  return acc + Math.min(...perimeters) + lengths[0]*lengths[1]*lengths[2]
}, 0)

console.log(total)
console.log(ribbon)
