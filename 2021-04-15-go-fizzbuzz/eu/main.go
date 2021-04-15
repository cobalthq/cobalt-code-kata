package main

import (
	"strconv"
)

func FizzBuzz(num uint64) (result string) {
	if num%3 == 0 {
		result += "Fizz"
	}
	if num%5 == 0 {
		result += "Buzz"
	}
	if len(result) == 0 {
		return strconv.FormatUint(num, 10)
	}
	return
}
