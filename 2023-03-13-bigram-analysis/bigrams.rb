#!/usr/bin/env ruby

input = File.read('input').split.map{ |i| i.downcase.gsub(/[^a-zA-Z\s]/i, '')}

map = Hash.new { |hash, key| hash[key] = Hash.new { |h, k| h[k] = 0 } }

input.each_with_index do |item, index|
  next if index < 2

  prev = input[index - 2...index]
  map[prev][input[index]] += 1
end

map.each do |key, value|
  item_count = value.values.sum

  following = value.map do |k, v|
    [k, v.to_f / item_count]
  end.to_h

  puts "#{key} => #{following}"
end
