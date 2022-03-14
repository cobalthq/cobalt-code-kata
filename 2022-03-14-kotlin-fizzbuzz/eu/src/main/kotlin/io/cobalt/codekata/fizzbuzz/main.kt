package io.cobalt.codekata.fizzbuzz

const val FIZZ = "Fizz"
const val BUZZ = "Buzz"

fun fizzBuzz(num: Int): String {
    val result = StringBuilder()
    if (isFizz(num)) {
        result.append(FIZZ)
    }
    if (isBuzz(num)) {
        result.append(BUZZ)
    }
    return if (result.isEmpty()) {
        num.toString()
    } else {
        result.toString()
    }
}

private fun isFizz(num: Int) = num % 3 == 0

private fun isBuzz(num: Int) = num % 5 == 0
