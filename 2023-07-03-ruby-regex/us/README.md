# Regex Engine

## Part 1. Explicit Concatenation Operators

Add plus signs explicitly to the regex.

So this: `a b | c (d | e)* f`

Becomes this: `a + b | c + (d | e)* + f`

## Part 2. Shunting Yard

1. Establish operator precedence:
   1. ‘*’ has the highest priority.
   2. ‘+’ comes next.
   3. ‘|’ has the lowest priority.
2. Create a “Output Queue” and a “Operator Stack”.
3. Reading characters from left to right…
   1. If it’s a letter,
      * Add it to output queue.
   2. If it’s an operator…
      * While there exists an operator on top of stack with equal or higher priority, pop it from stack and add it to output queue.
      * Push the operator into the stack.
   3. If it’s a ‘(‘
      * Add it to the operator stack.
   4. If it’s a ‘)’
      * Keep popping from the stack and add them to the queue, until you hit a ‘(’, then discard both parentheses.
4. Fin. Your output queue is the postfix notation.
