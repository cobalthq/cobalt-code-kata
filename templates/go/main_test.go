package main_test

import (
	"testing"

	main "github.com/cobalthq/cobalt-code-kata/example"
)

func TestExample(t *testing.T) {
	if main.Example() != 0 {
		t.Error("Example fail message")
	}
}
