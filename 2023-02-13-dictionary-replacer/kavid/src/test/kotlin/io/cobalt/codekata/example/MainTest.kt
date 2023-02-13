package io.cobalt.codekata.example

import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.ValueSource

class MainTest {
    @Test
    fun `empty input, empty output`() {
        Assertions.assertEquals(example("", mapOf<String, String>()), "")
    }

    @Test
    fun `single word input, single word output`() {
        Assertions.assertEquals(example("\$hello\$", mapOf("hello" to "world")), "world")
    }

    @Test
    fun `multiple words`() {
        Assertions.assertEquals(example("\$temp\$ here comes the name \$name\$", mapOf( "temp" to "temporary",
            "name" to "John Doe")), "temporary here comes the name John Doe")
    }
}
