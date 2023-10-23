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

## Part 3. DFA

1 b 2
2 y 3
3 e 5
1 h 4
4 i 5

0 error — implicit

hi -> 5
bypass -> 0

## Part 4. NFA

0 error — implicit

1 h 2
2  3
3 i 4

hi -> 4
h -> 0
bypass -> 0

1 h 2
2 i 2
2  3

h -> 3
hi -> 3
hiii -> 3
bypass -> 0

## Part 5. Regex to NFA (Composition)

1 h 2
1 i 2
+
=> 1 h 2
   2 i 3

1 h 2
*
=> 1  4
   1  2
   2 h 3
   3  4

1 h 2
1 i 2
|
=> 1  2
   1  4
   2 h 3
   4 i 5
   3  6
   5  6
