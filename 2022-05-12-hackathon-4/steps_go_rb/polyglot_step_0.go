//;
package main

import "fmt"

func main() {
	var s string
	s = `package main

import "fmt"

func main() {
	s := %c%s%c
	fmt.Printf(s, 96, s, 96)
}
`
	fmt.Printf(s, 96, s, 96)
}
