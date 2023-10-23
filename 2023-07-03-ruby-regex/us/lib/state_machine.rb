# frozen_string_literal: true

class StateMachine
  attr_reader :graph, :opts

  def initialize(transitions, opts)
    graph_init = Hash.new { |h, k| h[k] = transition_hash }
    graph_init[opts[:start]] = transition_hash
    graph_init[opts[:finish]] = transition_hash
    @graph = transitions.each_line.each_with_object(graph_init) do |line, g|
      state1, edge, state2 = line.split(/ /)
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
          graph[new_state][edge].push(new_next_state)
        end
      end
    end
    opts[:finish] = other.opts[:finish] + max_state
    self
  end

  def union(other)
    max_state = graph.keys.max
    next_start = max_state + 1
    next_finish = next_start + 1
    max_state = next_finish
    other.graph.each do |state, edges|
      new_state = state + max_state
      edges.each do |edge, next_states|
        next_states.each do |next_state|
          new_next_state = next_state + max_state
          graph[new_state][edge].push(new_next_state)
        end
      end
    end
    graph[next_start][''].push(opts[:start], other.opts[:start] + max_state)
    graph[opts[:finish]][''].push(next_finish)
    graph[other.opts[:finish] + max_state][''].push(next_finish)
    opts[:start] = next_start
    opts[:finish] = next_finish
    self
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

  def transition_hash
    Hash.new { |h, k| h[k] = [] }
  end
end
