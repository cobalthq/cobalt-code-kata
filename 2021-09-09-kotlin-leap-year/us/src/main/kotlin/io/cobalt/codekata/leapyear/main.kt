package io.cobalt.codekata.leapyear

fun leapYear(year: Int): Boolean =
    when {
        year % 400 == 0 -> true
        year % 100 == 0 -> false
        year % 4 == 0 -> true
        else -> false
    }
