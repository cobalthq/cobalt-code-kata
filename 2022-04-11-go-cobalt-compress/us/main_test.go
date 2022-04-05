package main

import "testing"

func TestCompress_coooooobalt(t *testing.T) {
	result := Compress("coooooobalt")
	expected := "c6xobalt"
	if result != expected {
		t.Errorf("Expected compressed string to be '%s' but it was '%s'", expected, result)
	}
}

func TestCompress_stttartuuuup(t *testing.T) {
	result := Compress("stttartuuuup")
	expected := "cs3xtart4xup"
	if result != expected {
		t.Errorf("Expected compressed string to be '%s' but it was '%s'", expected, result)
	}
}
