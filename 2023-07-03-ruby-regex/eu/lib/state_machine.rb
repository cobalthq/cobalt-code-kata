# frozen_string_literal: true

class StateMachine
  def initialize(transitions, opts)
    @opts = opts
    @graph = transitions.each_line.each_with_object(
      {'0' => {}, @opts[:start] => {}, @opts[:finish] => {}}
    ) do |line, g|
      s1, edge, s2 = line.strip.split(/ /)
      g[s1] ||= {}
      g[s1][edge] = s2
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
end
