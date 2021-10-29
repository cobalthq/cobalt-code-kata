package main

import (
	"fmt"
	"strings"
)

func main() {
	queue := "QUEUE"
	t := byte(96)
	n := string(byte(10))
	oN := string(byte(92)) + string(byte(110))
	q := string(byte(34))
	oQ := string(byte(92)) + q
	c := ":"
	oC := string(byte(99)) + string(byte(99))
	s := `package main

import (
	"fmt"
	"strings"
)

func main() {
	queue := "%s"
	t := byte(96)
	n := string(byte(10))
	oN := string(byte(92)) + string(byte(110))
	q := string(byte(34))
	oQ := string(byte(92)) + q
	c := ":"
	oC := string(byte(99)) + string(byte(99))
	s := %c%s%c
	slf := fmt.Sprintf(s, strings.ToUpper("queue"), t, s, t)
	queueReplacer := strings.NewReplacer(n, oN, q, oQ)
	arr := strings.SplitN(queue+":"+strings.ReplaceAll(slf, c, oC), ":", 2)
	rp := strings.NewReplacer(oC, c, strings.ToUpper("queue"), queueReplacer.Replace(arr[1]))
	fmt.Println(rp.Replace(arr[0]))
}`
	slf := fmt.Sprintf(s, strings.ToUpper("queue"), t, s, t)
	queueReplacer := strings.NewReplacer(n, oN, q, oQ)
	arr := strings.SplitN(queue+":"+strings.ReplaceAll(slf, c, oC), ":", 2)
	rp := strings.NewReplacer(oC, c, strings.ToUpper("queue"), queueReplacer.Replace(arr[1]))
	fmt.Println(rp.Replace(arr[0]))
}
