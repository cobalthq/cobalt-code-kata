package main

import (
	"strings"
	"testing"
	"testing/quick"
)

func TestFizzBuzz_map(t *testing.T) {
	assertionMap := map[uint64]string{
		1:  "1",
		2:  "2",
		3:  "Fizz",
		5:  "Buzz",
		6:  "Fizz",
		10: "Buzz",
		15: "FizzBuzz",
		30: "FizzBuzz",
	}
	for input, output := range assertionMap {
		result := FizzBuzz(input)
		if result != output {
			t.Errorf("Expecting FizzBuzz(%d) to be %#v but it's %#v", input, output, result)
		}
	}
}

func TestFizzBuzz_propFizz(t *testing.T) {
	property := func(num uint16) bool {
		return strings.HasPrefix(FizzBuzz(uint64(num)*3), "Fizz")
	}
	if err := quick.Check(property, nil); err != nil {
		t.Error(err)
	}
}

func TestFizzBuzz_propBuzz(t *testing.T) {
	property := func(num uint8) bool {
		return strings.HasSuffix(FizzBuzz(uint64(num)*5), "Buzz")
	}
	if err := quick.Check(property, nil); err != nil {
		t.Error(err)
	}
}
