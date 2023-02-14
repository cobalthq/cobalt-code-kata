# frozen_string_literal: true

class Example
  def dict_replace(str='', dict={})
    keys = str.scan(/\$(\w+)\$/)
    out = str
    keys.each do |key|
      k = key.first
      out.gsub!("$#{k}$", dict[k]) unless dict[k].nil?
    end
    out
  end
end
