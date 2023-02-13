function dictionaryReplace(text = "", dec = {}) {
  dec[''] = '$'
  const arr = text.split('$')
  return arr.map((word, index) => {
    return index % 2 === 0 ? word : dec[word]
  }).join("")
}

module.exports = {
  dictionaryReplace,
}
