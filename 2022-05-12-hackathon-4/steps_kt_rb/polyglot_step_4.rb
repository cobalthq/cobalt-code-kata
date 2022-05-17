//; def val(rb); eval($rb = rb); end; class String; def toString; self; end; end; class Integer; def toChar; self.chr; end; end
val rb = '$'.toString() + 'r' + 'b'
val rbCode = """def main(&block)
  block.call
end
def fun(_); end; def println(str); puts(str); end
def val(str)
  str.define_singleton_method(:format) do |*args|
    q = 34.chr
    sprintf(
      str.gsub('%c', '%s'),
      q * 3,
      $rb,
      q * 3,
      q * 3,
      str.gsub('%c', q + q + '%c'),
      q * 3
    )
  end
end
"""

fun main() {
    val template = """//; def val(rb); eval($rb = rb); end; class String; def toString; self; end; end; class Integer; def toChar; self.chr; end; end
val rb = '$'.toString() + 'r' + 'b'
val rbCode = ""%c%s""%c

fun main() {
    val template = ""%c%s""%c
    val q = 34.toChar()
    println(template.format(q, rbCode, q, q, template, q))
}"""
    val q = 34.toChar()
    println(template.format(q, rbCode, q, q, template, q))
}
