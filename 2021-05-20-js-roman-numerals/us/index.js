function toRoman(num) {
  const roman = {
    50: 'L',
    40: 'XL',
  }
  if (roman.hasOwnProperty(num)) {
    return roman[num]
  }
  let result = ''
  let n = num
  for (const number of Object.keys(roman).sort().reverse()) {
    if (n >= number) {
      result += roman[number]
      n -= number
    }
  }
  if (n >= 10) {
    delta = Math.floor(n / 10)
    result += 'X'.repeat(delta)
    n -= delta * 10
  }
  if (n >= 9) {
    result += 'IX'
    n -= 9
  }
  if (n >= 5) {
    result += 'V'
    n -= 5
  }
  if (n >= 4) {
    result += 'IV'
    n -= 4
  }
  return result + 'I'.repeat(n)
}

module.exports = {
  toRoman
}
