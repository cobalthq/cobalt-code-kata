# frozen_string_literal: true

class StateMachine
  attr_reader :graph, :opts

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
    input.chars.inject(epsilon_steps([opts[:start]])) do |acc, c|
      epsilon_steps(step_fw(acc, c))
    end.include?(opts[:finish])
  end

  def concat(other)
    # finish of self to start of other
    max_state = graph.keys.max
    other.opts
    other.graph.each do |state, edges|
      new_state =
        if state == other.opts[:start]
          opts[:finish]
        else
          state + max_state
        end
      edges.each do |edge, next_states|
        next_states.each do |next_state|
          new_next_state =
            if next_state == other.opts[:start]
              opts[:finish]
            else
              next_state + max_state
            end
          graph[new_state] ||= {}
          graph[new_state][edge] ||= []
          graph[new_state][edge].push(new_next_state)
        end
      end
    end
    opts[:finish] = other.opts[:finish] + max_state
    self
  end

  def union(other)
  end

  def star
  end

  protected

  def epsilon_steps(state)
    state | step_fw(state, '')
  end

  def step_fw(state, c)
    state.flat_map do |s|
      graph[s]&.fetch(c, nil)
    end
  end
end
