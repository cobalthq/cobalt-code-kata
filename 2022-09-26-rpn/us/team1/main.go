package main

import (
	"strconv"
	"strings"
)

var funcMap map[string]func(int, int) int

// Rpn calculates result of a correctly formed reverse Polish notation expression
func Rpn(input string) int {
	funcMap = map[string]func(int, int) int{
		"+": func(a, b int) int { return a + b },
		"-": func(a, b int) int { return a - b },
		"*": func(a, b int) int { return a * b },
		"/": func(a, b int) int { return a / b },
	}
	terms := strings.Split(input, " ")
	stack := make([]int, 0)
	for _, term := range terms {
		num, err := strconv.Atoi(term)
		if err != nil {
			result := funcMap[term](stack[len(stack)-2], stack[len(stack)-1])
			if len(stack) > 2 {
				stack = append(stack[:len(stack)-2], result)
			} else {
				stack = make([]int, 1)
				stack[0] = result
			}
		} else {
			stack = append(stack, num)
		}
	}
	return stack[0]
}
