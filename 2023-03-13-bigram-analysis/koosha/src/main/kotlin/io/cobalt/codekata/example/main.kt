package io.cobalt.codekata.example

data class BiGram(
    val word0: String,
    val word1: String,
) {

    override fun toString(): String {
        return "(${this.word0} ${this.word1})"
    }
}

fun doProcess(
    inputText: String,
): Map<BiGram, Map<String, Double>> {

    val words = inputText.split(' ')
    if (words.size < 3)
        throw IllegalArgumentException("expecting at least 3 words in the input")

    val counts = mutableMapOf<BiGram, MutableMap<String, Int>>()
    for (i in 0..(words.size - 3)) {
        val first = words[i]
        val second = words[i + 1]
        val next = words[i + 2]

        val bigram = BiGram(first, second)
        val count: MutableMap<String, Int> = counts.computeIfAbsent(bigram) { mutableMapOf() }
        count[next] = count.getOrDefault(next, 0) + 1
    }

    val probabilities = mutableMapOf<BiGram, MutableMap<String, Double>>()
    for ((bigram, nextCount) in counts) {
        val probability = mutableMapOf<String, Double>()
        val total = nextCount.values.sum()
        for ((word, wordCount) in nextCount)
            probability[word] = wordCount.toDouble() / total
        probabilities[bigram] = probability
    }

    return probabilities
}

fun main(vararg args: String) {

    val result = if (args.isNotEmpty()) {
        doProcess(args.joinToString(" "))
    }
    else {
        doProcess("I wish I may I wish I might")
    }

    for (entry in result)
        println("${entry.key} => ${entry.value}")
}
