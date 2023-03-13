const { bigramAnalysis } = require('./index')

test('counts stats for every token', () => {
  expect(bigramAnalysis('I wish I may I wish I might')).toEqual({
    'I wish': { 'I': 1 },
    'wish I': { 'may': 0.5, 'might': 0.5 },
    'I may': {'I': 1},
    'may I': {'wish': 1},
  })
})