def chop(num, arr)
  return -1 if arr.length == 0

  pivot = arr.length / 2
  delta = pivot
  check = -1
  while pivot != check
    check = pivot

    x = arr[pivot]
    return pivot if x == num

    delta = delta % 2 == 0 ? delta / 2 : delta / 2 + 1
    if x > num
      pivot -= delta
    else
      pivot += delta
    end
    pivot = 0 if pivot < 0
    pivot = arr.length - 1 if pivot >= arr.length
  end

  -1
end

#                      [0, 1, 2, 3, 4]
#                          |
#                [0, 1]         [2, 3, 4]
#                         |
#          [0], [1]            [2], [3, 4]
