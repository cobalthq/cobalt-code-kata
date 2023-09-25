# frozen_string_literal: true

class StateMachine
  def initialize(transitions, opts)
    @graph = transitions.each_line.each_with_object({}) do |line, g|
      state1, edge, state2 = line.split(' ')
      g[state1.to_i] ||= {}
      g[state1.to_i][edge] = state2.to_i
    end
    @opts = opts
  end

  def run(input)
    state = @opts[:start]
    input.each_char do |c|
      if @graph[state]&.key?(c)
        state = @graph[state][c]
      else
        state = 0
      end
    end
    @opts[:finish] == state
  end
end
