package io.cobalt.codekata.leapyear

import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test
import kotlin.random.Random

class MainTest {
    // private val seed = Random(123).nextInt()
    // private val subSeed = Random(234).nextInt(1,24)
    // FIXED LATER AFTER FINDING A BUG
    private val seed = Random(System.currentTimeMillis()).nextInt(1, Int.MAX_VALUE / 1000)
    private val subSeed = Random(System.currentTimeMillis()).nextInt(1,24)
    private val table = mapOf(
        Pair(1, false),
        Pair(2, false),
        Pair(4, true),
        Pair(100, false),
        Pair(400, true),
        Pair(500, false),
        Pair(404, true)
    )

    @Test
    fun `leap year if dividable by 400`() {
        Assertions.assertTrue(leapYear(seed * 400))
    }

    @Test
    fun `1 is not a leap year`() {
        Assertions.assertFalse(leapYear(seed * 4 + 1))
    }

    @Test
    fun `divisible by 100 but not by 400 are NOT leap years`() {
        Assertions.assertFalse(leapYear(seed * 400 + 100))
    }

    @Test
    fun `divisible by 4 but not by 100 ARE leap years`() {
        Assertions.assertTrue(leapYear(4))
        Assertions.assertTrue(leapYear(8))
        Assertions.assertTrue(leapYear(100 * seed + 4))
        Assertions.assertTrue(leapYear(100 * seed + 4 * subSeed))
    }

    @Test
    fun `table passes`() {
        Assertions.assertTrue(table.all { leapYear(it.key) == it.value })
    }
}
