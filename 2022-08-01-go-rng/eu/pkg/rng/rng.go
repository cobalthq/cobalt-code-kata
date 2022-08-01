package rng

var seed int64 = 1111

func Seed(s int64) {
	seed = s
}

func MCG() int64 {
	seed = seed * 16807 % 2147483647
	return seed
}

// Random returns a float [0,1)
func Random() float64 {
	return float64(MCG()-1) / float64(2147483646)
}
