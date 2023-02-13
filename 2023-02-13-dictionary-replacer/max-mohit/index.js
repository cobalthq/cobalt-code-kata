/**
 * Parse a template string to static string.
 * @param {string} templateString - Template string.
 * @param {object} valueDict - Dictionary of values to be filled in the template string.
 * @return {string} Static string with values filled.
 */
const stringTemplateParser = (templateString = "", valueDict = {}) => {
  const variablePatternRegex = /\$(\S+)\$/g
  const matchedWords= templateString.match(variablePatternRegex)
 
  if(!matchedWords) {
    return templateString
  }

  let finalStr = templateString

  matchedWords.forEach((matchedWord) => {
    const valKey = matchedWord.replaceAll('$', '')
    finalStr = finalStr.replace(matchedWord, valueDict[valKey])
  })

  return finalStr
}

module.exports = {
  stringTemplateParser
}