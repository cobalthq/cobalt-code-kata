package main

import (
	"fmt"

	"github.com/dlclark/regexp2"
)

func appendResult(current string, count int, letter byte) string {
	if count > 1 {
		return fmt.Sprintf("%s%dx%c", current, count, letter)
	} else {
		return fmt.Sprintf("%s%c", current, letter)
	}
}

func Compress2(input string) (output string) {
	count := 1
	if len(input) < 2 {
		return input
	}
	for i := 1; i < len(input); i++ {
		if input[i] == input[i-1] {
			count++
		} else {
			output = appendResult(output, count, input[i-1])
			count = 1
		}
	}
	return appendResult(output, count, input[len(input)-1])
}

func Compress(input string) (output string) {
	matcher := regexp2.MustCompile(`(.)\1*`, 0)
	match, _ := matcher.FindStringMatch(input)
	for {
		if match == nil {
			break
		}
		groups := match.Groups()
		l := len(groups[0].String())
		if l > 1 {
			output = fmt.Sprintf("%s%dx%s", output, l, groups[1].String())
		} else {
			output = fmt.Sprintf("%s%s", output, groups[1].String())
		}
		match, _ = matcher.FindNextMatch(match)
	}
	return
}

func main() {
	fmt.Println(Compress("coooooobalt"))
}
