import org.junit.jupiter.api.Test

internal class FiniteStateMachineTest {

    val machine = FiniteStateMachine()

    @Test
    fun `Output is correct`() {
        val start = "S1"
        val sequence = arrayListOf(0, 1, 1, 0, 1)
        val output = machine.runFMS(start, sequence)

        assert(output == 9)
    }
}
