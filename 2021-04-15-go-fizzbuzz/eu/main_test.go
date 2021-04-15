package main

import (
	"strings"
	"testing"
	"testing/quick"
)

func TestFizzBuzz_1(t *testing.T) {
	result := FizzBuzz(1)
	if result != "1" {
		t.Errorf("FizzBuzz(1) is expected to be '1', got %#v", result)
	}
}

func TestFizzBuzz_map(t *testing.T) {
	assertionTable := map[uint64]string{
		1:  "1",
		2:  "2",
		3:  "Fizz",
		4:  "4",
		5:  "Buzz",
		6:  "Fizz",
		10: "Buzz",
		15: "FizzBuzz",
	}
	for input, output := range assertionTable {
		result := FizzBuzz(input)
		if result != output {
			t.Errorf("FizzBuzz(%v) is expected to be %#v, got %#v", input, output, result)
		}
	}
}

func TestFizzBuzz_fizz(t *testing.T) {
	property := func(num uint8) bool {
		return strings.HasPrefix(FizzBuzz(uint64(num)*3), "Fizz")
	}
	if err := quick.Check(property, nil); err != nil {
		t.Error(err)
	}
}

func TestFizzBuzz_buzz(t *testing.T) {
	property := func(num uint8) bool {
		return strings.HasSuffix(FizzBuzz(uint64(num)*5), "Buzz")
	}
	if err := quick.Check(property, nil); err != nil {
		t.Error(err)
	}
}

func TestFizzBuzz_num(t *testing.T) {
	property := func(num uint8) bool {
		result := FizzBuzz(uint64(num)*15 + 1)
		return !strings.HasSuffix(result, "Buzz") && !strings.HasPrefix(result, "Fizz")
	}
	if err := quick.Check(property, nil); err != nil {
		t.Error(err)
	}
}
