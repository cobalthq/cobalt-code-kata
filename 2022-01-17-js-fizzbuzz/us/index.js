const FIZZ = 3
const BUZZ = 5
const FIZZ_BUZZ_VALUES = {
  [FIZZ]: 'fizz',
  [BUZZ]: 'buzz'
}
const ORDER = [FIZZ, BUZZ]
const isAFizzOrABuzz = (num, fizzBuzzKey) => num % fizzBuzzKey === 0

function fizzBuzz(num) {
  if (typeof num !== 'number' || num <= 0) throw new Error(`Bad input ${num}`)
  const result = ORDER.reduce((acc, key) => {
    if (isAFizzOrABuzz(num, key)) acc += FIZZ_BUZZ_VALUES[key]
    return acc
  }, '')
  return result || num.toString()
}

module.exports = {
  fizzBuzz,
}
