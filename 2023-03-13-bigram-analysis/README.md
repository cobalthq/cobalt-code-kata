# Bigram Analysis

A [bigram](https://en.wikipedia.org/wiki/Bigram) is a sequence of two adjacent
elements from a string of tokens, which are typically letters, syllables, or
words.

Given a sequence of tokens as an input for each bigram deduced from the string
we want to get a probability distribution for which token could follow it:

Example:

Input:

```ruby
"I wish I may I wish I might"
# or
["I", "wish", "I", "may", "I", "wish", "I", "might"]
```

Output:

```ruby
{
  "I wish" => {"I" => 1.0}
  "wish I" => {"may" => 0.5, "might" => 0.5}
  "may I"  => {"wish" => 1.0}
  "I may"  => {"I" => 1.0}
}
```
