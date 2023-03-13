package main

import (
	"fmt"
	"os"
	"regexp"
)

type Bigram struct {
	First  string
	Second string
}

func main() {
	dat, err := os.ReadFile("input.txt")
	if err != nil {
		panic(err)
	}
	re := regexp.MustCompile("(?i)[^a-z]*\\s+[^a-z]*")
	words := re.Split(string(dat), -1)
	bigrams := make(map[Bigram]map[string]float64)
	for i, word := range words {
		if i < 2 {
			continue
		}
		bigram := Bigram{words[i-2], words[i-1]}
		_, ok := bigrams[bigram]
		if !ok {
			bigrams[bigram] = make(map[string]float64)
		}
		bigrams[bigram][word] += 1
	}
	for bigram, value := range bigrams {
		sum := 0.0
		for _, v := range value {
			sum += v
		}
		for word := range value {
			value[word] = value[word] / sum
		}

		fmt.Printf("Bigram: %s,%s = %v", bigram.First, bigram.Second, value)
	}
}
