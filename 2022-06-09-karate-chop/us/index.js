function chop1(num, arr) {
  if (arr.length === 0) {
    return -1
  }

  const middleIndex = parseInt(arr.length / 2)

  if (arr[middleIndex] === num) {
    return middleIndex
  } else if (arr[middleIndex] < num) {
    return chop(num, arr.slice(middleIndex, arr.length)) + middleIndex
  } else {
    return chop(num, arr.slice(0, middleIndex))
  }
}

function chop(num, arr) {
  const searchItem = (start, end) => {
    const mid = parseInt((start + end) / 2)

    if (start > end) {
      return -1
    }

    if (num === arr[mid]) {
      return mid
    }

    if (num > arr[mid]) {
      return searchItem(mid + 1, end)
    }
    return searchItem(start, mid -1)
  }

  return searchItem(0, arr.length)
}

module.exports = {
  chop,
  chop1,
}
