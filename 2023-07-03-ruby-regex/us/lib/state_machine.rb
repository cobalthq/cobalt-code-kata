# frozen_string_literal: true

class StateMachine
  def initialize(transitions, opts)
    @graph = transitions.each_line.each_with_object({}) do |line, g|
      state1, edge, state2 = line.split(/ /)
      g[state1.to_i] ||= {}
      g[state1.to_i][edge] ||= []
      g[state1.to_i][edge].push(state2.to_i)
    end
    @opts = opts
  end

  def run(input)
    input.chars.inject(epsilon_steps([@opts[:start]])) do |acc, c|
      epsilon_steps(step_fw(acc, c))
    end.include?(@opts[:finish])
  end

  protected

  def epsilon_steps(state)
    state | step_fw(state, '')
  end

  def step_fw(state, c)
    state.flat_map do |s|
      @graph[s]&.fetch(c, nil)
    end
  end
end
