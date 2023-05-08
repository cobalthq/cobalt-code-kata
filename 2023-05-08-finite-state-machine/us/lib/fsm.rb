# frozen_string_literal: true

class FSM
  attr_reader :instructions

  def initialize(instructions)
    @instructions = instructions.split("\n").each_with_object({}) do |line, instr|
      state, next_states, output = line.strip.split(/; ?/)
      instr[state] = {changes: next_states.split(/, ?/), output: output.to_i}
    end
  end

  def run(input)
    state = input.inject('S1') do |acc, i|
      instructions[acc][:changes][i]
    end
    instructions[state][:output]
  end
end
