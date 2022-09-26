package main_test

import (
	"testing"

	main "github.com/cobalthq/cobalt-code-kata/rpn"
)

func TestOneNumber(t *testing.T) {
	result := main.Rpn("2")
	if result != 2 {
		t.Errorf("Expected 2, got %v", result)
	}
}

func TestAddition(t *testing.T) {
	result := main.Rpn("2 2 +")
	if result != 4 {
		t.Errorf("Expected 4, got %v", result)
	}
}

func TestSubtraction(t *testing.T) {
	result := main.Rpn("3 2 -")
	if result != 1 {
		t.Errorf("Expected 1, got %v", result)
	}
}

func TestTwoOperations(t *testing.T) {
	result := main.Rpn("3 2 - 1 +")
	if result != 2 {
		t.Errorf("Expected 2, got %v", result)
	}
}

// 3 5 8 * 7 + * => ((5*8)+7)*3 = 141
func TestEverything(t *testing.T) {
	result := main.Rpn("3 5 8 * 7 + *")
	if result != 141 {
		t.Errorf("Expected 141, got %v", result)
	}
}
