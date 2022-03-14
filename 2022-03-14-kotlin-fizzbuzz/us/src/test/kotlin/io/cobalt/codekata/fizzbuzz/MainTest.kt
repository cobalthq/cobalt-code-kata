package io.cobalt.codekata.fizzbuzz

import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.ValueSource

class MainTest {
    @Test
    fun `returns "FizzBuzz" for 0`() {
        Assertions.assertEquals("FizzBuzz", fizzBuzz(0))
    }

    @Test
    fun `returns "1" for 1`() {
        Assertions.assertEquals("1", fizzBuzz(1))
    }

    @Test
    fun `returns "2" for 2`() {
        Assertions.assertEquals("2", fizzBuzz(2))
    }

    @Test
    fun `throws IllegalArgument for -3`() {
        Assertions.assertThrows(
            IllegalArgumentException::class.java
        ) { fizzBuzz(-3) }
    }

    @ParameterizedTest
    @ValueSource(ints = [3, 6, 9])
    fun `returns "Fizz" for fizz values`(num: Int) {
        Assertions.assertEquals("Fizz", fizzBuzz(num))
    }

    @ParameterizedTest
    @ValueSource(ints = [5, 10, 20])
    fun `returns "Buzz" for buzz values`(num: Int) {
        Assertions.assertEquals("Buzz", fizzBuzz(num))
    }

    @ParameterizedTest
    @ValueSource(ints = [15, 30])
    fun `returns "FizzBuzz" for fizzbuzz values`(num: Int) {
        Assertions.assertEquals("FizzBuzz", fizzBuzz(num))
    }
}
