function fizzBuzz(num) {
  if (typeof num !== 'number') throw Error(`Bad Input: '${num}'`)
  const divisibleBy3 = num % 3 === 0
  const divisibleBy5 = num % 5 === 0
  let result = ''
  if (divisibleBy3) result += 'fizz'
  if (divisibleBy5) result += 'buzz'
  if (result.length === 0) result = num.toString()
  return result
}

module.exports = {
  fizzBuzz,
}
