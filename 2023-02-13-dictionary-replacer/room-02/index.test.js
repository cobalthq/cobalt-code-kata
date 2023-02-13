const { dictionaryReplacer } = require('./index')

test('returns original string if dictionary is empty', () => {
  expect(dictionaryReplacer('abc', {})).toEqual('abc')
})

test('when we have only one replacable item - returns string with replaced value', () => {
  expect(dictionaryReplacer('abc $first$ ghi', { 'first': 'def'})).toEqual('abc def ghi')
})

test('replaces all entries from dictionary with values', () => {
  expect(dictionaryReplacer('abc $first$ ghi $second$ mno', { first: 'def', second: 'jkl' })).toEqual('abc def ghi jkl mno')
})

test('replaces values recursively', () => {
  expect(dictionaryReplacer('abc $first$ ghi $second$ mno', { second: 'jkl', first: '$second$'  })).toEqual('abc jkl ghi jkl mno')
})