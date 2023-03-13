# frozen_string_literal: true

def bigram_analysis(text)
  sequence = text.split(/\W*\s+\W*|\W+/).reject {|w| w !~ /[a-z]/i }.map(&:downcase)
  bigrams = Hash.new { |hash, k| hash[k] = [] }
  sequence.each_cons(3) do |trigram|
    bigrams[trigram[..1]].push(trigram[-1])
  end
  bigrams.each_with_object({}) do |(bigram, arr), acc|
    numbers = arr.tally
    sum = arr.size
    acc[bigram] = numbers.each_with_object({}) do |(token, num), prob|
      prob[token] = num.to_f / sum
    end
  end
end

p bigram_analysis("I wish I may I wish I might")

article = <<TEXT
From Wikipedia, the free encyclopedia
A bigram or digram is a sequence of two adjacent elements from a string of tokens, which are typically letters, syllables, or words. A bigram is an n-gram for n=2.

The frequency distribution of every bigram in a string is commonly used for simple statistical analysis of text in many applications, including in computational linguistics, cryptography, and speech recognition.

Gappy bigrams or skipping bigrams are word pairs which allow gaps (perhaps avoiding connecting words, or allowing some simulation of dependencies, as in a dependency grammar).

Applications
Bigrams, along with other n-grams, are used in most successful language models for speech recognition.[1]

Bigram frequency attacks can be used in cryptography to solve cryptograms. See frequency analysis.

Bigram frequency is one approach to statistical language identification.

Some activities in logology or recreational linguistics involve bigrams. These include attempts to find English words beginning with every possible bigram,[2] or words containing a string of repeated bigrams, such as logogogue.[3]
TEXT

p bigram_analysis(article)
