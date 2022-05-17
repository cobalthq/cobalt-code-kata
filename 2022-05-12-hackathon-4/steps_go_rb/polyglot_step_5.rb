//; def main; end; def package(_); end; def import(_); end; def const(_); end
//; def `(rb); $rb = rb; eval(sprintf($rb, 96.chr)); end
package main

import "fmt"

const rb = `
def main(&block)
  block.call if block
end
def string; end
def s(_);end
def var(_); end
def %c(str)
  $go = str
end
def fmt
  Class.new do
    def Printf(*args)
      t = 96.chr
      puts sprintf($go, t, t, $rb, t, t, $go, t)
    end
  end.new
end
def func(_); end
`

func main() {
	var s string
	s = `//; def main; end; def package(_); end; def import(_); end; def const(_); end
//; def %c(rb); $rb = rb; eval(sprintf($rb, 96.chr)); end
package main

import "fmt"

const rb = %c%s%c

func main() {
	var s string
	s = %c%s%c
	fmt.Printf(s, 96, 96, rb, 96, 96, s, 96)
}
`
	fmt.Printf(s, 96, 96, rb, 96, 96, s, 96)
}
