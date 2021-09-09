package io.cobalt.codekata.leapyear

// 1. All years divisible by 400 ARE leap years (so, for example, 2000 was indeed a leap year),
// 2. All years divisible by 100 but not by 400 are NOT leap years (so, for example, 1700, 1800, and 1900 were NOT leap years, NOR will 2100 be a leap year),
// 3. All years divisible by 4 but not by 100 ARE leap years (e.g., 2008, 2012, 2016),
fun leapYear(year: Int): Boolean =
    when {
        year % 400 == 0 -> true
        year % 100 == 0 -> false
        year % 4 == 0 -> true
        else -> false
    }
