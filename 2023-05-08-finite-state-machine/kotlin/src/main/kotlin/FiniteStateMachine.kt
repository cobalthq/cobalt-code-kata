class FiniteStateMachine {

    companion object {
        private val instructions = """
            S1; S1, S2; 9
            S2; S1, S3; 10
            S3; S4, S3; 8
            S4; S4, S1; 0"""
            .trimIndent()
            .split("\n")
    }

    fun runFMS(start: String, sequence: List<Int>): Int {
        var state = start
        var instruction = stateInstruction(state)

        sequence.forEach { input ->
            state = when (input) {
                0 -> instruction[1]
                1 -> instruction[2]
                else -> ""
            }.trim()

            instruction = stateInstruction(state)
        }
        return instruction[3].trim().toInt()
    }

    private fun stateInstruction(state: String): List<String> {
        return instructions
            .find { it.trim().startsWith(state) }
            ?.split(";|,".toRegex()) ?: emptyList<String>()
    }
}
