function toRoman(num) {
  switch(true) {
    case typeof num !== 'number':
      throw new Error('Bad input')
    case num >= 10:
      return `X${'I'.repeat(num-10)}`
    case num === 9:
      return 'IX'
    case num >= 5 && num < 9:
      return `V${'I'.repeat(num-5)}`
    case num === 4:
      return 'IV'
  }
  return 'I'.repeat(num)
}

module.exports = {
  toRoman
}
