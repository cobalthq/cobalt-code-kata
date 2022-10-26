package io.cobalt.codekata.example

class MarkdownTableFormatter {
    fun format(markdown: String): String {
        var matrix = markdown
            .split("\n")
            .map { column ->
                column.trim()
                    .split("|")
                    .map { it.trim() }
            }
        var transposedMatrix = transposeMatrix(matrix)

        transposedMatrix = transposedMatrix
            .map { column -> formatColumn(column) }
        transposedMatrix = transposeMatrix(transposedMatrix)
        return buildTable(transposedMatrix)
    }

    private fun formatColumn(column: List<String>): List<String> {
        if (column.isEmpty()) {
            return column
        }
        val maxColumnLength = column.maxOf { it.length }
        return column.map { padLength(it, maxColumnLength) }
    }

    private fun padLength(value: String, length: Int): String {
        var newValue = value
        val appendedChar = if (isDivider(value)) {
            '-'
        } else {
            ' '
        }
        while (newValue.length < length) {
            newValue += appendedChar
        }
        return newValue
    }

    private fun buildTable(matrix: List<List<String>>): String {
        return matrix.joinToString("\n") { columnValues ->
            columnValues.joinToString("|") {
                if (it.isEmpty()) {
                    it
                } else {
                    " $it "
                }
            }
        }.trim()
    }

    private fun isDivider(value: String): Boolean =
        value.matches("-+".toRegex())

    private fun transposeMatrix(matrix: List<List<String>>): List<List<String>> {
        val newMatrix = mutableListOf<MutableList<String>>()
        (0..matrix.first().size).forEach {
            newMatrix.add(mutableListOf())
        }

        matrix.forEachIndexed { _, rowValues ->
            rowValues.forEachIndexed { columnIndex, columnValue ->
                newMatrix[columnIndex].add(columnValue)
            }
        }

        return newMatrix
    }
}
