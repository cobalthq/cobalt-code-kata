def main(&block)
  block.call
end
def fun(_); end; def println(_); end
def val(str)
  str.define_singleton_method(:format) do |*args|
  end
end
fun main() {
    val template = """fun main() {
    val template = ""%c%s%c""
    println(template.format('"', template, '"'))
}"""
    println(template.format('"', template, '"'))
}
