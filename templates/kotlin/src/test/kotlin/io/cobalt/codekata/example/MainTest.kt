package io.cobalt.codekata.example

import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.ValueSource

class MainTest {
    @Test
    fun `is not defined`() {
        Assertions.assertNull(example())
    }
}
