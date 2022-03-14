package io.cobalt.codekata.fizzbuzz

import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.ValueSource

class MainTest {
    @ParameterizedTest
    @ValueSource(ints = [3, 6, 9])
    fun `It returns Fizz`(num: Int) {
        Assertions.assertEquals(FIZZ, fizzBuzz(num))
    }

    @ParameterizedTest
    @ValueSource(ints = [5, 10, 20])
    fun `It returns Buzz`(num: Int) {
        Assertions.assertEquals(BUZZ, fizzBuzz(num))
    }

    @ParameterizedTest
    @ValueSource(ints = [15, 30, 45])
    fun `It returns FizzBuzz`(num: Int) {
        Assertions.assertEquals("$FIZZ$BUZZ", fizzBuzz(num))
    }

    @ParameterizedTest
    @ValueSource(ints = [7, 1, 11])
    fun `It returns the value itself`(num: Int) {
        Assertions.assertEquals("$num", fizzBuzz(num))
    }

    @Test
    fun `string must be`() {
        Assertions.assertTrue(FIZZ.matches(Regex("[A-Z][a-z]+")))
    }
}
