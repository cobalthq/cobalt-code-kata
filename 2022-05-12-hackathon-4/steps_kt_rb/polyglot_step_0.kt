fun main() {
    val template = """fun main() {
    val template = ""%c%s%c""
    println(template.format('"', template, '"'))
}"""
    println(template.format('"', template, '"'))
}
