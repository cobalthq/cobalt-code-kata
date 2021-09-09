package io.cobalt.codekata.leapyear

import org.junit.jupiter.api.Assertions
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.MethodSource
import kotlin.random.Random

/**
 * 1. All years divisible by 400 ARE leap years (so, for example, 2000 was indeed a leap year),
2. All years divisible by 100 but not by 400 are NOT leap years (so, for example, 1700, 1800, and 1900 were NOT leap years, NOR will 2100 be a leap year),
3. All years divisible by 4 but not by 100 ARE leap years (e.g., 2008, 2012, 2016),
4. All years not divisible by 4 are NOT leap years (e.g. 2017, 2018, 2019).

 */

class MainTest {
    private val number = Random(System.currentTimeMillis()).nextInt(1, Int.MAX_VALUE / 1000)

    companion object {
        @JvmStatic
        fun dataSource() =
            listOf(
                Pair(2000, true),
                Pair(2400, true),
                Pair(400, true),
                Pair(4, true),
                Pair(8, true),
                Pair(1, false),
                Pair(2001, false),
                Pair(11, false),
                Pair(100, false),
                Pair(200, false),
            )
    }

    @ParameterizedTest
    @MethodSource("dataSource")
    fun `all sorts of leap and not leap`(pair: Pair<Int, Boolean>) {
        Assertions.assertEquals(pair.second, leapYear(pair.first))
        Assertions.assertTrue(leapYear(number*400))
        Assertions.assertFalse(leapYear(number * 4 + 3))
        Assertions.assertFalse(leapYear(number * 400 + 100), (number * 400 + 100).toString())
        Assertions.assertTrue(leapYear(number * 100 + 16))
    }
}
