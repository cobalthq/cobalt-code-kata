source = ((0..9).to_a + (?a..?z).to_a + (?A..?Z).to_a).join

p source

checksum = source.unpack('H*')[0].hex % 900001
sum = source.sum

restored = source.chars.each_with_index.all? do |c, i|
  one_removed = source[...i] + source[(i+1)..]
  found = false
  one_removed.scan(//) do
    if ($` + ((sum - one_removed.sum)%256).chr + $').unpack('H*')[0].hex % 900001 == checksum
      found = true
    end
  end
  found
end

p restored

restored = source.chars.each_with_index.all? do |c, i|
  one_replaced = source[...i] + source.chars.sample + source[(i+1)..]
  found = false
  one_replaced.scan(/./) do
    if ($` + ((sum - one_replaced.sum + $&.sum)%256).chr + $').unpack('H*')[0].hex % 900001 == checksum
      found = true
    end
  end
  found
end

p restored
