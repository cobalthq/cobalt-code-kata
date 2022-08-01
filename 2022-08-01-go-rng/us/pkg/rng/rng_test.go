package rng_test

import (
	"math"
	"sort"
	"testing"

	"github.com/cobalthq/cobalt-code-kata/rng/pkg/rng"
)

func TestKolmogorovSmirnovUniform(t *testing.T) {
	num := 300
	vals := make([]float64, num)
	for i := 0; i < num; i++ {
		vals[i] = rng.Random()
	}
	sort.Slice(vals, func(i, j int) bool {
		return vals[i] < vals[j]
	})
	expected := float64(0)
	diff := float64(0)
	for i := 0; i < num; i++ {
		diffBack := vals[i] - expected
		expected += 1 / float64(num)
		diffForward := expected - vals[i]
		if diffBack > diff {
			diff = diffBack
		}
		if diffForward > diff {
			diff = diffForward
		}
	}
	if diff > 0.07 {
		t.Errorf("Kolmogorov-Smirnov test failed diff=%f", diff)
	}
}

func TestMonteCarloPi(t *testing.T) {
	num := 10000
	inside := 0
	for i := 0; i < num; i++ {
		x := rng.Random()
		y := rng.Random()
		if x*x+y*y < 1 {
			inside += 1
		}
	}
	pi := 4 * float64(inside) / float64(num)
	err := math.Abs(pi-math.Pi) / math.Pi
	if err > 0.01 {
		t.Errorf("Monte Carlo Pi failed with err=%f", err)
	}
}
