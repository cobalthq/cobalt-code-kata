package io.cobalt.codekata.example

fun example(
    inputText: String?,
    dictionary: Map<String, String>,
): String? {


    if(inputText == null)
        return null

    if(dictionary.isEmpty())
        return inputText

    // $$$$$$$$$$$$
    // O(n * m) where m is number of keys
//    var output: String = inputText
//    dictionary.forEach { (k, v) ->
//        output = output.replace("$$k$", v)
//    }

    // O(n)
    var output = ""
    var accumulator = ""
    var state = 0
    for(c in inputText) {
        when(state) {
            0 -> {
                when (c) {
                    '$' -> {
                        state = 1
                    }
                    else -> {
                        output += c
                    }
                }
            }
            1 -> {
                when(c) {
                    '$' -> {
                        output += dictionary[accumulator]
                        accumulator = ""
                        state = 0
                    }
                    else -> {
                        accumulator += c
                    }
                }
            }
        }
    }

    return output
}

fun main() {

}
