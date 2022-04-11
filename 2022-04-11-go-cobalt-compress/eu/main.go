package main

import (
	"fmt"
)

func cobaltAppend(prev string, count int, letter byte) string {
	if count > 1 {
		return fmt.Sprintf("%s%dx%c", prev, count, letter)
	} else {
		return fmt.Sprintf("%s%c", prev, letter)
	}
}
func isDifferentLetterForward(input string, index int) bool {
	return index >= len(input)-1 || input[index] != input[index+1]
}

func Compress(input string) (output string) {
	count := 1
	for index := range input {
		if isDifferentLetterForward(input, index) {
			output = cobaltAppend(output, count, input[index])
			count = 1
		} else {
			count += 1
		}
	}
	return
}

func main() {
	fmt.Println(Compress("ccoooooobaltt"))
}
