# frozen_string_literal: true

class RegexEngine
  attr_reader :preprocess

  PREV = (('a'..'z').to_a + %w[) *]).freeze
  NEXT = (('a'..'z').to_a + %w[(]).freeze

  def initialize(spec)
    chars = spec.chars
    @preprocess = chars.shift || ''
    chars.each do |c|
      @preprocess += '+' if PREV.include?(@preprocess[-1]) && NEXT.include?(c)
      @preprocess += c
    end
  end
end
