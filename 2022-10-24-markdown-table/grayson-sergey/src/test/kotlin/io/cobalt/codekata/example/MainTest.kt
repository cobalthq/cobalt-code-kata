package io.cobalt.codekata.example

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.ValueSource

class MainTest {
    lateinit var tableFormatter: MarkdownTableFormatter

    @BeforeEach
    fun setUp() {
        tableFormatter = MarkdownTableFormatter()
    }

    @Test
    fun `It returns the header cell when the input is one header cell`() {
        val input = "| Syntax |"

        assertEquals(input, tableFormatter.format("| Syntax |"))
    }

    @Test
    fun `It returns the divider cell expanded when the input is one header cell with divider`() {
        val input = """
            | Syntax |
            | -- |
        """.trimIndent()

        val expected = """
            | Syntax |
            | ------ |
        """.trimIndent()

        assertEquals(
            expected,
            tableFormatter.format(input)
        )
    }

    @Test
    fun `It returns the header cell expanded when the input is one header cell with divider (that is longer than header)`() {
        val input = """
            | Syntax |
            | ---------------- |
        """.trimIndent()

        val expected = """
            | Syntax           |
            | ---------------- |
        """.trimIndent()

        assertEquals(
            expected,
            tableFormatter.format(input)
        )
    }

    @Test
    fun `It returns the header row when the input is one header row`() {
        val input = "| Syntax | Description |"

        assertEquals(input, tableFormatter.format("| Syntax | Description |"))
    }
}
