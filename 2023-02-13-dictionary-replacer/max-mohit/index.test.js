const { stringTemplateParser } = require('./index')

test('returns empty string for empty input', () => {
  expect(stringTemplateParser('', {})).toEqual('')
})

test('fills template value in string from the value dict', () => {
  expect(stringTemplateParser('$temp$', { temp: 'temporary' })).toEqual(
    'temporary'
  )
})

test('fills template value in string from the value dict', () => {
  expect(stringTemplateParser('$player$ plays $game$', { player: 'John', game: 'Zelda' })).toEqual(
    'John plays Zelda'
  )
})


test('returns original string if valueDict is empty', () => {
  expect(stringTemplateParser('', {})).toEqual('')
})