function bigramAnalysis(str) {

  const tokens = str.split(' ')

  const COUNT_SYMBOL = Symbol('count')
  
  const frequencyMap = tokens.reduce((acc, cur, index, arr) => {
    if (index < 2) {
      // no next 
      return acc
    }

    const curTuple = [arr[index - 2], arr[index - 1]].join(' ');

    if (acc[curTuple]) {
      acc[curTuple][COUNT_SYMBOL] += 1

      if (acc[curTuple][cur]) {
        acc[curTuple][cur] += 1
      }
      else {
        acc[curTuple][cur] = 1
      }
    } else {
      acc[curTuple] = {[cur] : 1, [COUNT_SYMBOL]: 1 }
    }

    return acc
  }, {})

  
  console.log(frequencyMap)
  const stats = Object.fromEntries(Object.entries(frequencyMap).map(([key, freq]) => {
    return [key, Object.fromEntries(Object.entries(freq).map(([subkey, val]) => {
      return [subkey, val / freq[COUNT_SYMBOL]]
    }))]
  }))

  console.log(stats)
  return stats
}


// testing from CLI

if (process.argv[2]) {
  bigramAnalysis(process.argv[2])
}


module.exports = {
  bigramAnalysis,
}