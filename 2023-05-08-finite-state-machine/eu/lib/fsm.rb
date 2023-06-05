# frozen_string_literal: true

# All tricks are performed by trained professionals.
# Please don't try this at home!
class FSM
  def initialize(instructions)
    method = instructions.split("\n").inject("def execute(state_input)\ncase state_input\n") do |m, line|
      md = line.match(/(\S{2}); (\S{2}), (\S{2}); (\d+)/)
      m + "in ['#{md[1]}', 0]\n'#{md[2]}'\n" +
      "in ['#{md[1]}', 1]\n'#{md[3]}'\n" +
      "in ['#{md[1]}', :output]\n#{md[4]}\n"
    end
    method += "else\nraise 'FAIL!'\nend\nend"
    self.class.class_eval(method)
  end

  def run(input)
    state = input.inject('S1') do |s, i|
      execute([s, i])
    end
    execute([state, :output])
  end
end
