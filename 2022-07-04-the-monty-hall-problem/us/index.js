const REPEAT_TIMES = 10000
let numberOfWinsStickingToTheChoice = 0
let numberOfWinsChangingDecision = 0

for (let run = 0; run < REPEAT_TIMES; run++) {
  const boxes = [false, false, false]
  const prize = Math.floor(Math.random() * 3)
  boxes[prize] = true
  const choice = Math.floor(Math.random() * 3)
  if (boxes[choice]) {
    numberOfWinsStickingToTheChoice++
  }
  let montyDoor
  for (let index = 0; index < boxes.length; index++) {
    if (index != prize && index != choice) {
      montyDoor = index
      break
    }
  }
  const changedChoice = [0, 1, 2].find(index => index != choice && index != montyDoor)
  if (boxes[changedChoice]) {
    numberOfWinsChangingDecision++
  }
}

console.log(100.0 * numberOfWinsStickingToTheChoice / REPEAT_TIMES)
console.log(100.0 * numberOfWinsChangingDecision / REPEAT_TIMES)
console.log(REPEAT_TIMES == numberOfWinsChangingDecision + numberOfWinsStickingToTheChoice)

/*
[+] [ ] [ ]

 ^
     ^
         ^

[ ] [+] [ ]

 ^
     ^
         ^

[ ] [ ] [+]

 ^
     ^
         ^

*/

numberOfWinsStickingToTheChoice = 0
numberOfWinsChangingDecision = 0

for (let prize = 0; prize < 3; prize++) {
  for (let choice = 0; choice < 3; choice++) {
    if (prize == choice) {
      numberOfWinsStickingToTheChoice++
    } else {
      numberOfWinsChangingDecision++
    }
  }
}

console.log(numberOfWinsStickingToTheChoice)
console.log(numberOfWinsChangingDecision)
