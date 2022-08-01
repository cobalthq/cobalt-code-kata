package rng_test

import (
	"math"
	"sort"
	"testing"
	"time"

	"github.com/cobalthq/cobalt-code-kata/rng/pkg/rng"
)

func TestKolmogorvSmirnovUniform(t *testing.T) {
	rng.Seed(time.Now().UnixMilli())
	num := 300
	values := make([]float64, num)
	for i := 0; i < num; i++ {
		values[i] = rng.Random()
	}
	sort.Slice(values, func(i, j int) bool {
		return values[i] < values[j]
	})
	low := float64(0)
	diff := float64(0)
	for i := 0; i < num; i++ {
		diffBack := values[i] - low
		low += 1 / float64(num)
		diffForw := low - values[i]
		if diffBack > diff {
			diff = diffBack
		}
		if diffForw > diff {
			diff = diffForw
		}
	}
	if diff > 0.07 {
		t.Errorf("Kolmogorov-Smirnov failed with diff=%f", diff)
	}
}

func TestMonteCarloPi(t *testing.T) {
	num := 10000
	xs := make([]float64, num)
	ys := make([]float64, num)
	for i := 0; i < num; i++ {
		xs[i] = rng.Random()
		ys[i] = rng.Random()
	}
	inside := 0
	for i := 0; i < num; i++ {
		if xs[i]*xs[i]+ys[i]*ys[i] < 1 {
			inside += 1
		}
	}
	pi := 4 * float64(inside) / float64(num)
	err := (math.Pi - pi) / math.Pi
	if err < 0 {
		err = -err
	}
	if err > 0.01 {
		t.Errorf("Monte Carlo finding Pi failed with err=%f", err)
	}
}
