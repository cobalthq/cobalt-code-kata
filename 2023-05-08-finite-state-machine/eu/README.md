# Finite State Machine

Ref: [Simple Finite State Machine Compiler](https://www.codewars.com/kata/59923f1301726f5430000059)

A [Finite State Machine (FSM)](https://en.wikipedia.org/wiki/Finite-state_machine) is an abstract
machine that can be in exactly one of a finite number of states at any given time. Simple examples are:

vending machines, which dispense products when the proper combination of coins is deposited;
elevators, whose sequence of stops is determined by the floors requested by riders;
traffic lights, which change sequence when cars are waiting;
combination locks, which require the input of combination numbers in the proper order.
In this Kata we are going to design our very own basic FSM class that takes in a string of instructions

instructions is a string input with the following format:

```text
first; next_if_input_0, next_if_input_1; output\n
second; next_if_input_0, next_if_input_1; output\n
third; next_if_input_0, next_if_input_1; output
```

A basic example would be:

```text
instructions = \
'''S1; S1, S2; 9
S2; S1, S3; 10
S3; S4, S3; 8
S4; S4, S1; 0'''
```

Where each line in the string describes a state in the FSM. Given in the example, if the current
state was S1, if the input is 0 it would loop back to itself: S1 and if the input is 1 it would go to S2

The instructions are compiled into the FSM class, then the run_fsm() method will be called to simulate the compiled FSM.

Example:

```text
# run_fsm takes in two arguments:

start = 'S1'
# where start is the name of the state that it starts from
sequence = [0, 1, 1, 0, 1]
# where sequence is a list of inputs
# inputs are only 1 or 0 (1 input variable)
# to keep it simple with this Kata
final_state, final_state_value, path = run_fsm(start, sequence)
# run_fsm should return a tuple as:
final_state => name of final state
final_state_value => integer value of state output
path => list of states the FSM sequence went through
```
