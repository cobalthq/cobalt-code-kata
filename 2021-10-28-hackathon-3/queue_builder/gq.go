package main

import (
	"fmt"
	"strings"
)

func main() {
	queue := "QUEUE"
	t := byte(96)
	n := string(byte(10))
	oN := string(byte(63)) + "n"
	q := string(byte(34))
	oQ := string(byte(63)) + "q"
	c := ":"
	oC := string(byte(63)) + "c"
	s := string(byte(32))
	oS := string(byte(63)) + "s"
	tab := string(byte(9))
	oTab := string(byte(63)) + "t"
	slfStr := `package main

import (
	"fmt"
	"strings"
)

func main() {
	queue := "%s"
	t := byte(96)
	n := string(byte(10))
	oN := string(byte(63)) + "n"
	q := string(byte(34))
	oQ := string(byte(63)) + "q"
	c := ":"
	oC := string(byte(63)) + "c"
	s := string(byte(32))
	oS := string(byte(63)) + "s"
	tab := string(byte(9))
	oTab := string(byte(63)) + "t"
	slfStr := %c%s%c
	slf := fmt.Sprintf(slfStr, strings.ToUpper("queue"), t, slfStr, t)
	queueReplacer := strings.NewReplacer(n, oN, q, oQ, c, oC, s, oS, tab, oTab)
	arr := strings.SplitN(queue+":"+queueReplacer.Replace(slf), ":", 2)
	outputReplacer := strings.NewReplacer(oN, n, oQ, q, oC, c, oS, s, oTab, tab)
	fmt.Println(strings.Replace(outputReplacer.Replace(arr[0]), strings.ToUpper("queue"), arr[1], 1))
}`
	slf := fmt.Sprintf(slfStr, strings.ToUpper("queue"), t, slfStr, t)
	queueReplacer := strings.NewReplacer(n, oN, q, oQ, c, oC, s, oS, tab, oTab)
	arr := strings.SplitN(queue+":"+queueReplacer.Replace(slf), ":", 2)
	outputReplacer := strings.NewReplacer(oN, n, oQ, q, oC, c, oS, s, oTab, tab)
	fmt.Println(strings.Replace(outputReplacer.Replace(arr[0]), strings.ToUpper("queue"), arr[1], 1))
}
