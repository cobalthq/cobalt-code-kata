# frozen_string_literal: true

class StateMachine
  attr_reader :graph, :opts

  def initialize(transitions, opts)
    @opts = opts.each_with_object({}) do |(k, v), acc|
      acc[k.to_sym] = v.to_i
    end
    if transitions.is_a?(Hash)
      @graph = {@opts[:start] => {}, @opts[:finish] => {}}.merge(transitions)
    else
      @graph = transitions.each_line.each_with_object(
        {@opts[:start] => {}, @opts[:finish] => {}}
      ) do |line, g|
        s1, edge, s2 = line.strip.split(/ /)
        g[s1.to_i] ||= {}
        g[s1.to_i][edge] ||= []
        g[s1.to_i][edge].push(s2.to_i)
      end
    end
  end

  def parse(input)
    start_state = [opts[:start]]
    start_state.push(*graph[opts[:start]]['']) if graph[opts[:start]]['']
    result = input.chars.inject(start_state) do |acc, c|
      acc.each_with_object([]) do |s, next_acc|
        next_chars = graph[s][c]
        next unless next_chars

        next_acc.push(*next_chars)
        next_chars.each do |next_char|
          next_acc.push(*graph[next_char]['']) if graph[next_char]['']
        end
      end.uniq
    end
    result.include?(opts[:finish])
  end

  def concat(sm)
    last_state = graph.keys.max
    new_state = ->(state) { state == sm.opts[:start] ? opts[:finish] : state + last_state }
    new_graph = sm.graph.each_with_object(graph.dup) do |(state, trans), acc|
      acc[new_state[state]] = trans.each_with_object({}) do |(edge, target_states), acc1|
        acc1[edge] = target_states.map { |target_state| new_state[target_state] }
      end
    end
    self.class.new(new_graph, {start: opts[:start], finish: sm.opts[:finish] + last_state})
  end

  def kleen_star
    last_state = graph.keys.max
    new_start = last_state + 1
    new_finish = last_state + 2
    new_graph = graph.each_with_object({}) do |(state, trans), acc|
      acc[state] = trans.dup
    end
    new_graph[opts[:finish]] ||= {}
    new_graph[opts[:finish]][''] ||= []
    new_graph[opts[:finish]][''].push(opts[:start], new_finish)
    new_graph[new_start] = {'' => [opts[:start], new_finish]}
    self.class.new(new_graph, {start: new_start, finish: new_finish})
  end

  def union(sm)
    last_state = graph.keys.max
    new_start = last_state + 1
    new_finish = last_state + 2
    last_state += 2
    new_graph = sm.graph.each_with_object(graph.dup) do |(state, trans), acc|
      acc[state + last_state] = trans.each_with_object({}) do |(edge, target_states), acc1|
        acc1[edge] = target_states.map { |target_state| target_state + last_state }
      end
    end
    new_graph[new_start] = {'' => [opts[:start], sm.opts[:start] + last_state]}
    new_graph[opts[:finish]] ||= {}
    new_graph[opts[:finish]][''] ||= []
    new_graph[opts[:finish]][''].push(new_finish)
    new_graph[sm.opts[:finish] + last_state] ||= {}
    new_graph[sm.opts[:finish] + last_state][''] ||= []
    new_graph[sm.opts[:finish] + last_state][''].push(new_finish)
    self.class.new(new_graph, {start: new_start, finish: new_finish})
  end
end
