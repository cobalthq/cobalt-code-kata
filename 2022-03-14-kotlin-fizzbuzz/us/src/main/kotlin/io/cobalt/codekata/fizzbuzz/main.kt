package io.cobalt.codekata.fizzbuzz

fun fizzBuzz(num: Int): String {
    if (num < 0) {
        throw IllegalArgumentException("Only non-negative values allowed")
    }
    val resultBuilder = StringBuilder()
    if (isFizz(num)) {
        resultBuilder.append("Fizz")
    }
    if (isBuzz(num)) {
        resultBuilder.append("Buzz")
    }
    return if (resultBuilder.isEmpty()) {
        "$num"
    } else {
        resultBuilder.toString()
    }
}

private fun isBuzz(num: Int) = num % 5 == 0

private fun isFizz(num: Int) = num % 3 == 0
