# frozen_string_literal: true

class StateMachine
  attr_reader :graph, :opts

  def initialize(transitions, opts)
    @opts = opts.each_with_object({}) do |(k, v), acc|
      acc[k.to_sym] = v.to_i
    end
    if transitions.is_a?(Hash)
      @graph = transitions
    else
      @graph = transitions.each_line.each_with_object(
        {@opts[:start] => {}, @opts[:finish] => {}}
      ) do |line, g|
        s1, edge, s2 = line.strip.split(/ /)
        g[s1.to_i] ||= {}
        g[s1.to_i][edge] = s2.to_i
      end
    end
  end

  def parse(input)
    result = input.chars.inject([@opts[:start]]) do |acc, c|
      acc.each_with_object([]) do |s, next_acc|
        next_char = @graph[s][c]
        next unless next_char

        next_acc.push(next_char)
        next_acc.push(@graph[next_char]['']) if @graph[next_char]['']
      end.uniq
    end
    result.include?(@opts[:finish])
  end

  def concat(sm)
    last_state = graph.keys.max
    new_graph = sm.graph.each_with_object(graph) do |(state, trans), acc|
      new_key = state == sm.opts[:start] ? opts[:finish] : state + last_state
      acc[new_key] = trans.each_with_object({}) do |(edge, target_state), acc1|
        acc1[edge] =
          if target_state == sm.opts[:start]
            opts[:finish]
          else
            target_state + last_state
          end
      end
    end
    self.class.new(new_graph, {start: opts[:start], finish: sm.opts[:finish] + last_state})
  end
end
