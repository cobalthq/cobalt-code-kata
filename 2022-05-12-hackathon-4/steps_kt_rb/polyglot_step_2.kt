//; def val(rb); $rb = rb; end
val rb = '$'.toString() + 'r' + 'b'
val rbCode = """def main(&block)
  block.call
end
def fun(_); end; def println(_); end
def val(str)
  str.define_singleton_method(:format) do |*args|
  end
end
"""

fun main() {
    val template = """//; def val(rb); $rb = rb; end
val rb = '$'.toString() + 'r' + 'b'
val rbCode = ""%c%s%c""

fun main() {
    val template = ""%c%s%c""
    println(template.format('"', rbCode, '"', '"', template, '"'))
}"""
    println(template.format('"', rbCode, '"', '"', template, '"'))
}
