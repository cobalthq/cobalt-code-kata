function secretSanta(data) {
  const dataObj = {}
  data.map((item, index) => {
    // Math.floor(Math.random() * (max - min + 1)) + min
    dataObj[item] = data[(index + 1) % data.length]
  })
  return dataObj;
}

module.exports = {
  secretSanta,
}
