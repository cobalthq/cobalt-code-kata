function countOccurences(input) {
  const split = input.split(" ");

  const occurences = {};
  for (let i = 0; i < split.length - 2; i++) {
    const bigram = `${split[i]} ${split[i + 1]}`;
    if (!occurences[bigram]) {
      occurences[bigram] = {};
    }
    const next = split[i + 2];

    occurences[bigram][next] = occurences[bigram][next]
      ? occurences[bigram][next] + 1
      : 1;
  }

  return occurences;
}

function calculateProbabilities(map) {
  const probs = {};
  for (const key in map) {
    const occurences = map[key];
    probs[key] = {};

    const total = Object.values(occurences).reduce((a, b) => a + b, 0);

    for (const next in occurences) {
      probs[key][next] = occurences[next] / total;
    }
  }
  return probs;
}

const input = "I wish I may I wish I might";

const occurences = countOccurences(input);

const probs = calculateProbabilities(occurences);

console.log(probs);
