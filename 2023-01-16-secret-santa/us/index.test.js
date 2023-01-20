const { secretSanta } = require('./index')

test('returns empty object for empty input', () => {
  expect(secretSanta([])).toEqual({})
})

test('returns object with 2 items for input with length 2', () => {
  const participants = ['jess', 'nick']
  expect(Object.keys(secretSanta(participants)).sort()).toEqual(participants.sort())
})

test('the key and value are not the same', () => {
  const participants = ['jess', 'nick']
  const obj = secretSanta(participants)
  Object.keys(obj).map(key => {
    expect(key).not.toEqual(obj[key])
  })
})

test('all participants should receive gifts when 2 participants', () => {
  const participants = ['jess', 'nick']
  expect(Object.values(secretSanta(participants)).sort()).toEqual(participants.sort())
})


test('all participants should receive gifts when 3 participants', () => {
  const participants = ['jess', 'nick', 'sergey']
  expect(Object.values(secretSanta(participants)).sort()).toEqual(participants.sort())
})

test('results of the assignment should be random', () => {
  const participants = ['jess', 'nick', 'sergey', 'josh']
  const results = Array.from({ length: 10 }).map(() => secretSanta(participants));

  const actual = results.some((res, index, arr) => {
    if (index === arr.length - 1) {
      return false;
    }
    return Object.entries(res).some(([key, value]) => arr[index + 1][key] !== value)
  });

  expect(actual).toEqual(true);
})

// test('returns two key-value pairs for a pair of entries', () => {
//   expect(secretSanta(['nick', 'jess'])).toEqual({
//     nick: 'jess',
//     jess: 'nick'
//   })
// })
