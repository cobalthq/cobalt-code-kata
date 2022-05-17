package main

import "fmt"

const rb = `module Polyglot
  def main(&block)
    block.call if block
  end
  def package(_); end
  def import(_); end
  def string; end
  def s(_);end
  def var(_); end
  def %c(str); end
  def fmt
    Class.new do
      def Printf(*args); end
    end.new
  end
  def func(_); end
end
include Polyglot
`

func main() {
	var s string
	s = `package main

import "fmt"

const rb = %c%s%c

func main() {
	var s string
	s = %c%s%c
	fmt.Printf(s, 96, rb, 96, 96, s, 96)
}
`
	fmt.Printf(s, 96, rb, 96, 96, s, 96)
}
