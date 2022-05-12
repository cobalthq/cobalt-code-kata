//;module Polyglot
//;  def main(&block)
//;    block.call if block
//;  end
//;  def package(_); end
//;  def import(_); end
//;  def string; end
//;  def s(_);end
//;  def var(_); end
//;  def `(str); end
//;  def fmt
//;    Class.new do
//;      def Printf(*args); end
//;    end.new
//;  end
//;  def func(_); end
//;end
//;include Polyglot
package main

import "fmt"

func main() {
	var s string
	s = `package main

import "fmt"

func main() {
	var s string
	s = %c%s%c
	fmt.Printf(s, 96, s, 96)
}
`
	fmt.Printf(s, 96, s, 96)
}
